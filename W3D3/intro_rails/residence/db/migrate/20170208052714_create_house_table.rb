class CreateHouseTable < ActiveRecord::Migration
  def change
    create_table :house do |t|
      t.string :address, null: false
      t.timestamps
    end
  end
end
