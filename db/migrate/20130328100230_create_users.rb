class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end