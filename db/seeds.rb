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

p "Created #{Employee.count} employee"