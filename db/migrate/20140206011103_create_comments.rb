class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user, :first_name, :user_id, :name 
      t.text :body
      t.references :event, :user, :user_id, :first_name, index: true

      t.timestamps
    end
  end
end
