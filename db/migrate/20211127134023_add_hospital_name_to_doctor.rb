class AddHospitalNameToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :hospital_name, :string
  end
end
