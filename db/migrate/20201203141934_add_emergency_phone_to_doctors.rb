class AddEmergencyPhoneToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :emergency_phone, :string
  end
end
