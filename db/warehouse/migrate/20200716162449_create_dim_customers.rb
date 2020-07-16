class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.string :CreationDate
      t.string :EnterpriseName
      t.string :ContactFullname
      t.string :ContactEmail
      t.string :NbElevator
      t.string :City

      t.timestamps
    end
  end
end
