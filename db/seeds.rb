# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
la = Location.create(city: "Suratganj", district:"Barabanki", state:"Uttar Pradesh", country:"India", address:"Main Chauraha", 
                    code: "OCM02", pin_code:"252301")
lb = Location.create(city: "Gayghat", district:"Basti", state:"Uttar Pradesh", country:"India", address:"Panchayat", 
                    code: "OCM03", pin_code:"232501")
DocumentType.create(document_category:"10th Marksheet")
DocumentType.create(document_category:"Aadhaar card")
AssetDetail.create(asset_category:"Laptop", identifier_type:"Serial Number/Service Tag")
AssetDetail.create(asset_category:"Mobile", identifier_type:"IMEI number")
AssetDetail.create(asset_category:"SIM Card", identifier_type:"Contact number")
Employee.create(location: Location.first, employee_code:"OCM02007", name:"Satish Kaushik", dob:Date.new(1980,11,14), gender:"Male", current_designation:"Sales Executive", 
                  date_of_joining: Date.today-8.months, blood_group: "B+", personal_contact_no: "1234567890", father_name:"Deepak Kaushik", 
                  mother_name: "Shanti Devi", emergency_contact_no:"1234567899", emergency_contact_name:"Vineet Kaushik", 
                  emergency_contact_relation:"brother", personal_email: "test1@test.com", official_email:"test1@example.com", 
                  local_address:"Jantar Mantar ke pass", permanent_address: "Near Chaawdi bazaar", isManager: false)