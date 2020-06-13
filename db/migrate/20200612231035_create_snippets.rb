class CreateSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :code
      t.integer :user_id
      t.boolean :is_private

      t.timestamps
    end
  end
end
