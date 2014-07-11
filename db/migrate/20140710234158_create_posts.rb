class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false
      t.text :body, null: false
      t.timestamps
      t.index :user_id
    end
  end
end