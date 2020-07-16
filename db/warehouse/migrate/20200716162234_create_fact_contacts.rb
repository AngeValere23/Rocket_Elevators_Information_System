class CreateFactContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.string :ContactId
      t.string :CreationDate
      t.string :EnterpriseName
      t.string :Email
      t.string :ProjectName

      t.timestamps
    end
  end
end
