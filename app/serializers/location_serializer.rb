class LocationSerializer < ActiveModel::Serializer
  attributes :id, :city, :district, :state, :country, :address, :code, :pin_code, :current

  has_many :employees

  # puts @location.employees.first

  def current
    {
      name: "Current name",
      designation: "Top Dawg!"
    }
  end
end
