class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :at
      t.references :vehicle,type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
