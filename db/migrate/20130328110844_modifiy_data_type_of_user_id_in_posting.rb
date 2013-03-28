class ModifiyDataTypeOfUserIdInPosting < ActiveRecord::Migration
  def up
  	change_column :postings, :user_id, :string
  end

  def down
  end
end
