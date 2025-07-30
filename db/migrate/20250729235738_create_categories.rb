class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name_en
      t.string :name_bn
      t.integer :parent_id

      t.timestamps
    end
  end
end
