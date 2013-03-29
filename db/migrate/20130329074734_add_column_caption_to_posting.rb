class AddColumnCaptionToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :caption, :string
  end
end
