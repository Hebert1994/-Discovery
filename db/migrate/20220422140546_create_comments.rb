class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :course_id
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :course_id
  end
end
