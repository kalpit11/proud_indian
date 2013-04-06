class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.datetime :commented_on
      t.integer :posting_id

      t.timestamps
    end
  end
end
