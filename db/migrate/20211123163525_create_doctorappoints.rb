class CreateDoctorappoints < ActiveRecord::Migration[6.1]
  def change
    create_table :doctorappoints do |t|
      t.string :notes
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
