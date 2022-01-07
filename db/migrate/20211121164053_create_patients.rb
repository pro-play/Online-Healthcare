class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.string :address
      t.boolean :gender
      t.date :dob
      t.string :email
      t.string :password_digest
      t.integer :phone

      t.timestamps
    end
  end
end
