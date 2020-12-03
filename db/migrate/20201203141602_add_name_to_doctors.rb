class AddNameToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :name, :string
  end
end
