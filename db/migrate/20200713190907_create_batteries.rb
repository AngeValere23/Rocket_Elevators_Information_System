class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :Building, foreign_key: true
      t.string :PropertyType
      t.string :Status
      t.references :Employee, foreign_key: true
      t.datetime :DateOfCommissioning
      t.datetime :DateOfLastInspec
      t.binary :CertficatOfOperation

      t.timestamps
    end
  end
end
