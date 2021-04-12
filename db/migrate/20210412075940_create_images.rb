class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title, null: false
      t.text   :catch_copy, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
