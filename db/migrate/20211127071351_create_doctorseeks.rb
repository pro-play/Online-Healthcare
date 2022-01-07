class CreateDoctorseeks < ActiveRecord::Migration[6.1]
  def change
    create_table :doctorseeks do |t|
      t.string :notes
      t.string :doctor_name
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :doctorappoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
