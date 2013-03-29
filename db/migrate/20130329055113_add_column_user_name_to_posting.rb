class AddColumnUserNameToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :user_name, :string
  end
end
