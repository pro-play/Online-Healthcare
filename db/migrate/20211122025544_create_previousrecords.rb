class CreatePreviousrecords < ActiveRecord::Migration[6.1]
  def change
    create_table :previousrecords do |t|
      t.string :previous_records
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
