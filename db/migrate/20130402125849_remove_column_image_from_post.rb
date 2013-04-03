class RemoveColumnImageFromPost < ActiveRecord::Migration
  def up
    remove_column :postings, :image
  end

  def down
    add_column :postings, :image, :string
  end
end
