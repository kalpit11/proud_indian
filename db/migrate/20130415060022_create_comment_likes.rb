class CreateCommentLikes < ActiveRecord::Migration
  def change
    create_table :comment_likes do |t|
      t.integer :user_id
      t.string :user_name
      t.integer :posting_id

      t.timestamps
    end
  end
end
