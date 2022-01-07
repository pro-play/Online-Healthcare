class AddDoctorNameToPrescription < ActiveRecord::Migration[6.1]
  def change
    add_column :prescriptions, :doctorName, :string
  end
end
