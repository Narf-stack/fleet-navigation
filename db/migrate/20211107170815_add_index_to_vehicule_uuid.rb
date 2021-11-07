class AddIndexToVehiculeUuid < ActiveRecord::Migration[6.0]
  def change
    add_index :vehicles, :id, unique: true
  end
end
