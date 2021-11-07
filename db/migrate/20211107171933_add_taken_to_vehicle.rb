class AddTakenToVehicle < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :taken, :boolean, default: false
  end
end
