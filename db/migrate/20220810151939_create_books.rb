class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :isbn, null: false
      t.string :publication_year, null: false
      t.float :price, null: false
      t.string :edition
      t.string :image_url
      t.references :publisher, index: true
      t.timestamps
    end
  end
end
