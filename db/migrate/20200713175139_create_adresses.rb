class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :TypeOfAdress
      t.string :Status
      t.string :Entity
      t.string :NumberAndStreet
      t.string :string
      t.string :SuiteOrApart
      t.string :integer
      t.string :City
      t.string :PostalCode
      t.string :Country
      t.text :Notes

      t.timestamps
    end
  end
end
