class AddAdminIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :admin_id, :integer
    add_index :courses, :admin_id
  end
end
