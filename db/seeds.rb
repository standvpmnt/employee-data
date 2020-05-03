# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# la = Location.create(city: "Suratganj", district:"Barabanki", state:"Uttar Pradesh", country:"India", address:"Main Chauraha", 
#                     code: "OCM02", pin_code:"252301")
# lb = Location.create(city: "Gayghat", district:"Basti", state:"Uttar Pradesh", country:"India", address:"Panchayat", 
#                     code: "OCM03", pin_code:"232501")
# DocumentType.create(document_category:"10th Marksheet")
# DocumentType.create(document_category:"Aadhaar card")
# AssetDetail.create(asset_category:"Laptop", identifier_type:"Serial Number/Service Tag")
# AssetDetail.create(asset_category:"Mobile", identifier_type:"IMEI number")
# AssetDetail.create(asset_category:"SIM Card", identifier_type:"Contact number")
# Employee.create(location: Location.first, employee_code:"OCM02007", name:"Satish Kaushik", dob:Date.new(1980,11,14), gender:"Male", current_designation:"Sales Executive", 
#                   date_of_joining: Date.today-8.months, blood_group: "B+", personal_contact_no: "1234567890", father_name:"Deepak Kaushik", 
#                   mother_name: "Shanti Devi", emergency_contact_no:"1234567899", emergency_contact_name:"Vineet Kaushik", 
#                   emergency_contact_relation:"brother", personal_email: "test1@test.com", official_email:"test1@example.com", 
#                   local_address:"Jantar Mantar ke pass", permanent_address: "Near Chaawdi bazaar", isManager: false)
require 'faker'

i = 7
20.times do 
  i += 1
  emp_code = Location.find(rand(2)+1).code + [i].map {|e| format('%03d', e % 1000)}[0]
  Employee.create(location: Location.find(rand(2)+1), employee_code:emp_code, name:Faker::Name.first_name + ' ' + Faker::Name.last_name, dob:Faker::Date.between(from: 60.years.ago, to: 20.years.ago), gender:Faker::Gender.binary_type, current_designation:Faker::Job.title, 
                    date_of_joining: Faker::Date.between(from: 3.years.ago, to: Date.today), blood_group: "B+", personal_contact_no: Faker::Number.unique.number(digits: 10).to_s, father_name:Faker::Name.name, 
                    mother_name: Faker::Name.name, emergency_contact_no:Faker::Number.unique.number(digits: 10).to_s, emergency_contact_name:Faker::Name.name, 
                    emergency_contact_relation:Faker::Relationship.familial, personal_email: Faker::Internet.unique.email, official_email:Faker::Internet.unique.email, 
                    local_address:Faker::Address.unique.street_address , permanent_address: Faker::Address.street_address , isManager: false)
end