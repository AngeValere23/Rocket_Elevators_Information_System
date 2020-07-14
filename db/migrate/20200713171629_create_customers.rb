class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.reference :User

      t.timestamps
    end
  end
end
