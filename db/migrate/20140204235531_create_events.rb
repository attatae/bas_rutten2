class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_start
      t.text :text
      t.integer :user_id
      t.text :user 

      t.timestamps
    end
  end
end