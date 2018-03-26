class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :content_id
      t.integer :user_id
      t.string :subject
      t.text :com_content

      t.timestamps
    end
  end
end
