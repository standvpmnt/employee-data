class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_code, :name, :dob, :gender, :current_designation

  belongs_to :location
end