class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :User, foreign_key: true
      t.string :CompanyName
      t.references :Adress, foreign_key: true
      t.string :FullNameOfContact
      t.string :CompanyPhone
      t.string :EmailOfContact
      t.string :FullNameOfServiceTechAutority
      t.string :TechnicalAutorityPhone
      t.string :TechnicalManagerEmail

      t.timestamps
    end
  end
end
