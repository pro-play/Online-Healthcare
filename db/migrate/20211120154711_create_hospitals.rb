class CreateHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :hospitals do |t|
      t.string :hospital_name
      t.string :address
      t.string :email
      t.string :password_digest
      t.string :phone

      t.timestamps
    end
  end
end
