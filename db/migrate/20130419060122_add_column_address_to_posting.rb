class AddColumnAddressToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :address, :text
  end
end
