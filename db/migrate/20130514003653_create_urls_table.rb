class CreateUrlsTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short
      t.string :full
      t.integer :count
      t.references :user
    end
  end
end
