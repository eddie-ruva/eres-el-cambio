class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :author
      t.text :description
      t.integer :county_id
      t.string :group

      t.timestamps
    end
  end
end
