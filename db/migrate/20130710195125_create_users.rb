class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 		:name
      t.string 		:mugshot_id
      t.string 		:yammer_url
      t.references 	:initiative

      t.timestamps
    end
  end
end
