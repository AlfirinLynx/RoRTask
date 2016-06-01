class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  belongs_to :route

  has_many :wagons
  has_many :tickets
  

  # Возвращает массив купейных вагонов
  def compartment_wagons
    wagons.select { |wagon| wagon.wagon_type == 'compartment' }
  end
  
  # Массив плацкартных вагонов
  def reserved_wagons
    wagons.select { |wagon| wagon.wagon_type == 'reserved' }
  end

  # Число купейных вагонов
  def compartment_number
    self.compartment_wagons.size
  end

  # Число плацкартных вагонов
  def reserved_number
    self.reserved_wagons.size
  end

  # Числа нижних и верхних купейных мест
  def compartment_lower_seats
    compartment_wagons.map { |wagon| wagon.lower_seats}.reduce(0, :+)
  end

  def compartment_upper_seats
    compartment_wagons.map { |wagon| wagon.upper_seats}.reduce(0, :+)
  end

  # Числа нижних и верхних плацкартных мест
  def reserved_lower_seats
    reserved_wagons.map { |wagon| wagon.lower_seats}.reduce(0, :+)
  end

  def reserved_upper_seats
    reserved_wagons.map { |wagon| wagon.upper_seats}.reduce(0, :+)
  end
  
  validates :number, presence: true
end
