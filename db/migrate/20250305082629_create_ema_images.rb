class CreateEmaImages < ActiveRecord::Migration[8.0]
  def change
    create_table :ema_images do |t|
      t.references :ema, null: false, foreign_key: true
      t.string :image_type, null: false

      t.timestamps
    end
  end
end
