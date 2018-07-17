class CreateArriendos < ActiveRecord::Migration
  def change
    create_table :arriendos do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
      t.belongs_to :serie, index: true
      
      t.timestamps null: false
    end
  end
end
