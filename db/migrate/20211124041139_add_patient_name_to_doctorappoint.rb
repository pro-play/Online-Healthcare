class AddPatientNameToDoctorappoint < ActiveRecord::Migration[6.1]
  def change
    add_column :doctorappoints, :patientName, :string
  end
end
