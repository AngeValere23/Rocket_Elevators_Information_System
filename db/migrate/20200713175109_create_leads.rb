class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :FullName
      t.string :CompagnyName
      t.string :Email
      t.string :Phone
      t.string :ProjectName
      t.string :ProjectDesc
      t.string :text
      t.string :Departement
      t.text :Message
      t.binary :AttachedFile

      t.timestamps
    end
  end
end
