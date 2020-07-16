namespace :warehouse do
  desc "TODO"
  task seed: :environment do

  # FactQuote
  FactQuote.delete_all
  Quote.all.each do |quote|
    FactQuote.create(:QuoteId => quote.id, :CreationDate => quote.created_at, :EnterpriseName => quote.businessname, :Email => quote.email, :NbElevator => quote.nbelevator)
  end

  # FactContact
  FactContact.delete_all
  Lead.all.each do |lead| 
    FactContact.create(:ContactId => lead.id, :CreationDate => lead.created_at, :EnterpriseName => lead.CompanyName, :Email => lead.Email, :ProjectName => lead.ProjectName)
  end

  # FactElevator
  FactElevator.delete_all
  Elevator.all.each do |elevator|
    FactElevator.create(:SerialNumber => elevator.serialNumber, :CommissioningDate => elevator.DateOfCommissioning, :BuildingId => elevator.Column.battery.building.id, :CustomerId => elevator.Column.battery.building.customer.id, :City => elevator.Column.battery.building.address.City)
  end

  # DimCustomer
  DimCustomer.delete_all
  Customer.all.each do |customer|
    DimCustomer.create(:CreationDate => customer.created_at, :EnterpriseName => customer.CompanyName, :ContactFullname => customer.FullNameOfContact, :ContactEmail => customer.EmailOfContact, :NbElevator => Elevator.where(Column: customer.building.battery.column).count, :City => customer.address.City)
  end

  puts "Warehouse updated !"
  end
end
