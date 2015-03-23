class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string     :name
      t.references :initiative
      t.string     :yammer_url
      t.string	   :mugshot_id
      t.timestamps
    end
  end
end
