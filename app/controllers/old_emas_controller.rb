class OldEmasController < ApplicationController
  def index
    emas = Ema.includes(:ema_images).order(:created_at)

    Thread.new do
      emas.each do |ema|
        ActionCable.server.broadcast("room_channel", {
          message: "old",
          data: {
            title: "古いイラストを受信しました",
            description: "古いイラストを受信しました",
            urls: {
              wish: ema.wish_image&.image&.attached? ? url_for(ema.wish_image.image) : nil,
              name: ema.name_image&.image&.attached? ? url_for(ema.name_image.image) : nil,
              illustration: ema.illustration&.image&.attached? ? url_for(ema.illustration.image) : nil
            }
          }
        })
        sleep 10
      end
    end

    render json: { message: "post old emas. and send websocket message with old ema datas." }
  end
end
