class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.text :post
      t.string :image
      t.string :video
      t.datetime :post_on
      t.integer :user_id

      t.timestamps
    end
  end
end
