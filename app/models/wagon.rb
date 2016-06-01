class Wagon < ActiveRecord::Base
  belongs_to :train

  def self.compartment_wagons
    all.select { |wagon| wagon.wagon_type == 'compartment' }
  end

  def self.reserved_wagons
    all.select { |wagon| wagon.wagon_type == 'reserved' }
  end

  validates :number, :lower_seats, :upper_seats, :wagon_type, presence: true
  validates :wagon_type, inclusion: { in: %w(compartment reserved) }
  validates :lower_seats, :upper_seats, numericality: { greater_than_or_equal_to: 0 }
end
