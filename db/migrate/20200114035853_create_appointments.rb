class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :saved, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
