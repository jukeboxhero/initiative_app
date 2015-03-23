class RemoveEphemeralColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :name,       :string
    remove_column :users, :mugshot_id, :string
    remove_column :users, :yammer_url, :string
  end
end
