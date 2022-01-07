class AddPatientNameAndDoctorNameAndSymptomsAndNotesToPreviousrecord < ActiveRecord::Migration[6.1]
  def change
    add_column :previousrecords, :patient_name, :string
    add_column :previousrecords, :doctorName, :string
    add_column :previousrecords, :symptoms, :string
    add_column :previousrecords, :notes, :string
    remove_column :previousrecords, :previous_records, :string
  end
end
