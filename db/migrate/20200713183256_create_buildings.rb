class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :Customer, foreign_key: true
      t.references :Adress, foreign_key: true
      t.string :BuildingAdmFullName
      t.string :BuildingAdmEmail
      t.string :BuildingAdmPhone
      t.string :BuildingTechFullName
      t.string :BuildingTechEmail
      t.string :BuildingTechPhone

      t.timestamps
    end
  end
end
