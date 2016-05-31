class Wagon < ActiveRecord::Base
  belongs_to :train

  validates :number, presence: true
  validates :lower_seats, presence: true
  validates :upper_seats, presence: true
end
