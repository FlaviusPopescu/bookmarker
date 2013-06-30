class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :path
      t.integer :site_id

      t.timestamps
    end
  end
end
