json.id @location.id
json.district @location.district

json.employees do 
  json.id @location.employees.last.id
  json.name @location.employees.last.name
end