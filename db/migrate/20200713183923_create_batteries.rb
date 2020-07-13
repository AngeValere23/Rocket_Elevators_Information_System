class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :Building, foreign_key: true
      t.string :PropertyType
      t.sring :Status
      t.reference :Employee
      t.datetime :DateOfCommissioning
      t.datetime :DateOfLastInspec
      t.binary :CertficatOfOperation
      t.string :Informations
      t.text :Notes

      t.timestamps
    end
  end
end
