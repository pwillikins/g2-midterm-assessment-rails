class AddCommentColumn < ActiveRecord::Migration
  def change
    remove_column :comments, :body
    add_column :comments, :comment, :text
  end

  def down
    remove_column :comments, :comment
    add_column :comments, :body, :text
  end
end
