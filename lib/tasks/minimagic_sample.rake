namespace :minimagic_sample do
  task run: :environment do
    puts "start"
    original = MiniMagick::Image.open(Rails.root.join("lib/tasks/want_sheet.png"))
    width = original.width
    height = original.height
    puts "Width: #{width}, Height: #{height}"

    # illustration_crop: 上の領域（0%〜40%）
    illustration_crop = original.clone
    illustration_crop.crop("85%x60%+#{(width * 0.08).to_i}+#{(height * 0.03).to_i}")
    illustration_save_path = Rails.root.join("illustration_sample.png")
    illustration_crop.write(illustration_save_path)
    puts "保存しました: #{illustration_save_path}"

    # name_crop: 中央のお名前の領域（40%〜60%）
    original = MiniMagick::Image.open(Rails.root.join("lib/tasks/want_sheet.png"))
    width = original.width
    height = original.height
    puts "Width: #{width}, Height: #{height}"
    name_crop = original.clone
    name_crop.crop("85%x15%+#{(width * 0.08).to_i}+#{(height * 0.64).to_i}")
    name_save_path = Rails.root.join("name_sample.png")
    name_crop.write(name_save_path)
    puts "保存しました: #{name_save_path}"

    # wish_crop: 中央のお名前の領域（40%〜60%）
    original = MiniMagick::Image.open(Rails.root.join("lib/tasks/want_sheet.png"))
    width = original.width
    height = original.height
    puts "Width: #{width}, Height: #{height}"
    wish_crop = original.clone
    wish_crop.crop("85%x15%+#{(width * 0.08).to_i}+#{(height * 0.80).to_i}")
    wish_save_path = Rails.root.join("wish_sample.png")
    wish_crop.write(wish_save_path)
    puts "保存しました: #{wish_save_path}"
  end
end
