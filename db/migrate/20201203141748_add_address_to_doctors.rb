class AddAddressToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :address, :string
  end
end
