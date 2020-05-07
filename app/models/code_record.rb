class CodeRecord < ApplicationRecord
  belongs_to :location
  belongs_to :employee

  def self.new_code(loc_id)
    a = self.where(location_id: loc_id).maximum(:employee_count)+1 || 1
    return {"new code" => Location.find(loc_id).code + format("%03d", a)}
  end
  
  def self.new_employee(emp)
    a = self.new(employee:emp, location:emp.location, 
        employee_count:emp.employee_code[emp.location.code.length...].to_i, 
        code: emp.employee_code)
    if a.save
      return true
    else
      false
    end
  end
  
  def self.check_code(emp)
    if emp.location.code == emp.employee_code[0..emp.location.code.length-1]
      return true
    else
      return false
    end
  end

end
