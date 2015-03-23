class AddStatusToInitiatives < ActiveRecord::Migration
  def change
  	add_column :initiatives, :status, :string, :default => :active
  end
end
