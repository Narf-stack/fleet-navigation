class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles, id: :uuid do |t|

      t.timestamps
    end
  end
end
