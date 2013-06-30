class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :protocol
      t.string :host

      t.timestamps
    end
  end
end
