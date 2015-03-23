class FuckTheWhizzyBang < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mugshot_id, :string
    add_column :users, :title, :string
    add_column :users, :permalink, :string
    add_column :users, :email, :string
  end
end
