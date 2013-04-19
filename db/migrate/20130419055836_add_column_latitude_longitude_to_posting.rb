class AddColumnLatitudeLongitudeToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :longitude, :float
    add_column :postings, :latitude, :float
  end
end
