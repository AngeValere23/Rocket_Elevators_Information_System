class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :fullname
      t.string :email
      t.integer :phone
      t.string :businessname
      t.string :projectname
      t.integer :buildingtype
      t.integer :quality
      t.integer :nbapartment
      t.integer :nbfloor
      t.integer :nbbasemenet
      t.integer :nbbusiness
      t.integer :nbparking
      t.integer :nbshaft
      t.integer :nboccupant
      t.integer :nbcompanies
      t.integer :activehours
      t.integer :nbelevator
      t.float :elevatorprice
      t.float :subtotal
      t.float :installfee
      t.float :total

      t.timestamps
    end
  end
end
