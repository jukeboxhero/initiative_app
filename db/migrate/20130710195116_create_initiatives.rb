class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string 		:name
      t.datetime 	:start_date
      t.text 		:description
      t.string 		:mugshot_id
      t.timestamps
    end
  end
end
