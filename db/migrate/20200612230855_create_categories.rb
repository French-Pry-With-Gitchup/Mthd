class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :language
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
