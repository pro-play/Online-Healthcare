class CreatePatienttells < ActiveRecord::Migration[6.1]
  def change
    create_table :patienttells do |t|
      t.string :notes
      t.string :patient_name
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :doctorappoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
