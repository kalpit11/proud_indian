class CreatePostUnlikes < ActiveRecord::Migration
  def change
    create_table :post_unlikes do |t|
      t.integer :user_id
      t.string :user_name
      t.integer :posting_id

      t.timestamps
    end
  end
end
