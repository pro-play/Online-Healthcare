class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.string :address
      t.string :department
      t.string :qualification
      t.date :dob
      t.boolean :gender
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
