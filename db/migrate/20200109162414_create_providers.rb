class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :email
      t.string :category

      t.timestamps
    end
  end
end
