class CreateEmas < ActiveRecord::Migration[8.0]
  def change
    create_table :emas do |t|
      t.timestamps
    end
  end
end
