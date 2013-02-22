class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string  :name
      t.integer :security, :default => 0
      t.integer :public_services, :default => 0
      t.integer :citizen_proposals, :default => 0
      t.integer :community, :default => 0
      t.integer :happiness, :default => 0

      t.timestamps
    end
  end
end
