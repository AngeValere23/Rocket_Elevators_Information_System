# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Employee.destroy_all


# Create the needed user
ngenest = User.create(:email => "nicolas.genest@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
nfortier = User.create(:email => "nadya.fortier@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
mchantal = User.create(:email => "martin.chantal@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
mhoude = User.create(:email => "mathieu.houde@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
dboutin = User.create(:email => "david.boutin@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
mlortie = User.create(:email => "mathieu.lortie@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
tcarrier = User.create(:email => "thomas.carrier@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")

p "Created #{User.count} users"

Employee.create(:user_id => ngenest.id, :lastname => "Genest", :firstname => "Nicolas", :title => "Comm Rep")
Employee.create(:user_id => nfortier.id, :lastname => "Fortier", :firstname => "Nadya", :title => "Director")
Employee.create(:user_id => mchantal.id, :lastname => "Chantal", :firstname => "Martin", :title => "Director Assistant")
Employee.create(:user_id => mhoude.id, :lastname => "Houde", :firstname => "Mathieu", :title => "Captain")
Employee.create(:user_id => dboutin.id, :lastname => "Boutin", :firstname => "David", :title => "Engineer")
Employee.create(:user_id => mlortie.id, :lastname => "Lortie", :firstname => "Mathieu", :title => "Engineer")
Employee.create(:user_id => tcarrier.id, :lastname => "Carrier", :firstname => "Thomas", :title => "Engineer")

p "Created #{Employee.count} employees"

30.times {
    user = User.create(:email => Faker::Internet.unique.email,
      :password => "20Elevator07",
      :password_confirmation => "20Elevator07"
    )

    Employee.create(
      :user_id => user.id,
      :lastname => Faker::Name.unique.last_name,
      :firstname => Faker::Name.unique.last_name,
      :title => Faker::Construction.role
     )
}

30.times {
    User.create(
      :email => Faker::Internet.unique.email,
      :password => "20Elevator07",
      :password_confirmation => "20Elevator07"
    )
}

p "Created #{User.count} users"
p "Created #{Employee.count} employees"


100.times {
    Lead.create(
      :FullName => Faker::Name.unique.name,
      :CompanyName => Faker::Company.unique.name,
      :Email => Faker::Internet.unique.email,
      :Phone => Faker::PhoneNumber.unique.phone_number,
      :ProjectName => Faker::Company.unique.industry,
      :ProjectDesc => Faker::Company.type,
      :Message => Faker::Construction.subcontract_category,
      :Department => Faker::Commerce.department,
      :created_at => Faker::Date.between(from: 2.years.ago, to: Date.today)
    )
}

p "Create #{Lead.count} leads"

building_type = ["Residential", "Commercial", "Corporate", "Hybrid"]
service_quality = ["Standard", "Premium", "Excelium"]


150.times {
    Quote.create(
       :fullname => Faker::Name.unique.name,
       :email => Faker::Internet.unique.email,
       :phone => Faker::PhoneNumber.unique.phone_number,
       :businessname => Faker::Company.unique.name,
       :projectname => Faker::Company.industry,
       :quality => service_quality.sample,
       :buildingtype => building_type.sample,
       :nbapartment => Faker::Number.digit,
       :nbfloor => Faker::Number.digit,
       :nbbasement => Faker::Number.digit,
       :nbbusiness => Faker::Number.digit,
       :nbparking => Faker::Number.digit,
       :nbshaft => Faker::Number.digit,
       :nboccupant => Faker::Number.digit,
       :nbcompanies => Faker::Number.digit,
       :activehours => Faker::Number.digit,
       :nbelevator => Faker::Number.digit,
       :elevatorprice => Faker::Commerce.price,
       :subtotal => Faker::Commerce.price,
       :installfee => Faker::Commerce.price,
       :total => Faker::Commerce.price,
       :created_at => Faker::Date.between(from: 2.years.ago, to: Date.today)
     )
}

p "Create #{Quote.count} quotes"


type_of_address = ["Billing", "Shipping", "Home", "Business"]
status_type = ["Active", "Inactive"]
entity_type = ["Building", "Customer"]

csv_text = File.read(Rails.root.join('db', 'us-500.csv'))
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  Address.create(
    :TypeOfAddress => type_of_address.sample,
    :Status => status_type.sample,
    :Entity => entity_type.sample,
    :NumberAndStreet => row["address"],
    :SuiteOrAppart => Faker::Address.secondary_address,
    :City => row["city"],
    :PostalCode => row["zip"],
    :Country => row["USA"],
    :Notes => Faker::Types.rb_string)
end

p "Create #{Address.count} addresses"

user_id_for_customer = [*28..47]
address_id_for_customer = [*1..20]

20.times {
    Customer.create(

      :user_id => user_id_for_customer.delete(user_id_for_customer.sample),
      :CompanyName => Faker::Company.unique.name,
      :address_id => address_id_for_customer.delete(address_id_for_customer.sample),
      :FullNameOfContact => Faker::Name.unique.name,
      :CompanyPhone => Faker::PhoneNumber.unique.phone_number,
      :EmailOfContact => Faker::Internet.unique.email,
      :FullNameOfServiceTechAuthority => Faker::Name.unique.name,
      :TechnicalAuthorityPhone => Faker::PhoneNumber.unique.phone_number,
      :TechnicalAuthorityEmail => Faker::Internet.eunique.mail)
}

p "Create #{Customer.count} customers"


customer_id_for_building = [*1..20]
address_id_for_building = [*21..40]

20.times {
    Building.create(
      :customer_id => customer_id_for_building.delete(customer_id_for_building.sample),
      :address_id => address_id_for_building.delete(address_id_for_building.sample),
      :BuildingAdmFullName => Faker::Name.unique.name,
      :BuildingAdmEmail => Faker::Internet.unique.email,
      :BuildingAdmPhone => Faker::PhoneNumber.unique.phone_number,
      :BuildingTechFullName => Faker::Name.unique.name,
      :BuildingTechEmail => Faker::Internet.unique.email,
      :BuildingTechPhone => Faker::PhoneNumber.unique.phone_number)
}

p "Create #{Building.count} buildings"


building_id_for_detail = [*1..20]

20.times {
    BuildingDetail.create(
      :building_id => building_id_for_detail.delete(building_id_for_detail.sample),
      :key => Faker::Types.rb_string,
      :value => Faker::Types.rb_string)
}

p "Create #{BuildingDetail.count} buildings details"

building_id_for_battery = [*1..20]
employee_id_for_battery = [*1..20]

20.times {
    Battery.create(
      :building_id => building_id_for_battery.delete(building_id_for_battery.sample),
      :PropertyType => building_type.sample,
      :Status => status_type.sample,
      :employee_id => employee_id_for_battery.delete(employee_id_for_battery.sample),
      :DateOfCommissioning => Faker::Date.between(from: 3.years.ago, to: Date.today),
      :DateOfLastInspect => Faker::Date.between(from: 3.years.ago, to: Date.today),
      :CertificateOfOperation => Faker::Code.isbn)
}

p "Create #{Battery.count} batteries"


battery_id_for_column = [*1..20]

20.times {
    Column.create(
      :battery_id => battery_id_for_column.delete(battery_id_for_column.sample),
      :PropertyType => building_type.sample,
      :NumberOfFloor => Faker::Number.number(digits: 2),
      :Status => status_type.sample,
      :Informations => Faker::Types.rb_string,
      :Notes => Faker::Types.rb_string)
}

p "Create #{Column.count} columns"

column_id_for_elevator = [*1..20]

20.times {
    Elevator.create(
      :Column_id => column_id_for_elevator.delete(column_id_for_elevator.sample),
      :serialNumber => Faker::Code.isbn, :Model => service_quality.sample,
      :PropertyType  => building_type.sample,
      :Status => status_type.sample,
      :DateOfCommissioning => Faker::Date.between(from: 2.years.ago, to: Date.today),
      :DateOfLastInspection => Faker::Date.between(from: 2.years.ago, to: Date.today),
      :CertificateOfInpection => Faker::Code.isbn,
      :Information => Faker::Types.rb_string,
      :Notes => Faker::Types.rb_string)
}

p "Create #{Elevator.count} elevators"
