class EmasController < ApplicationController
  before_action :set_ema, only: [ :show ]

  def index
    emas = Ema.includes(:ema_images)
    render json: emas.map { |ema| format_ema(ema) }, status: :ok
  end

  def show
    render json: format_ema(@ema), status: :ok
  end

  def create
    return render json: { error: "画像が必要です" }, status: :unprocessable_entity unless params[:image].present?

    ema = Ema.new

    if ema.save
      split_and_attach_images(ema, params[:image])

      render json: format_ema(ema), status: :created
    else
      render json: { error: ema.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_ema
    @ema = Ema.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "絵馬が見つかりません" }, status: :not_found
  end

  def split_and_attach_images(ema, uploaded_image)
    # 画像をMiniMagickで処理
    image = MiniMagick::Image.read(uploaded_image.tempfile)
    width = image.width
    height = image.height

    # 画像を3分割
    illustration_crop = image.crop("100%x33%+0+0") # 上部1/3（イラスト）
    name_crop = image.crop("100%x33%+0+#{height / 3}") # 中央1/3（名前）
    wish_crop = image.crop("100%x34%+0+#{(height / 3) * 2}") # 下部1/3（願い事）

    # 画像を保存
    save_image(ema, illustration_crop, "illustration")
    save_image(ema, name_crop, "name")
    save_image(ema, wish_crop, "wish")
  end

  def save_image(ema, cropped_image, image_type)
    ema_image = ema.ema_images.create(image_type: image_type)
    file = Tempfile.new([ "ema_#{image_type}", ".png" ])
    cropped_image.write(file.path)
    ema_image.image.attach(io: File.open(file.path), filename: "#{image_type}.png")
    file.close
    file.unlink
  end

  def attach_image(ema, file, image_type)
    return unless file.present?

    ema_image = ema.ema_images.create(image_type: image_type)
    ema_image.image.attach(file)
  end

  def format_ema(ema)
    {
      id: ema.id,
      illustration: ema.illustration&.image&.attached? ? url_for(ema.illustration.image) : nil,
      name: ema.name_image&.image&.attached? ? url_for(ema.name_image.image) : nil,
      wish: ema.wish_image&.image&.attached? ? url_for(ema.wish_image.image) : nil,
      created_at: ema.created_at
    }
  end
end
