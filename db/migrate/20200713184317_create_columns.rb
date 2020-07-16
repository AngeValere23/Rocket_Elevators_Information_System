class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :batterie, foreign_key: true
      t.string :ProppertyType
      t.string :NumberOfFloor
      t.string :integer
      t.string :Status
      t.string :Informations
      t.string :string
      t.text :Notes

      t.timestamps
    end
  end
end
