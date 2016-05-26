class Ticket < ActiveRecord::Base
	validates :number, presence: true
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  belongs_to :user
  belongs_to :train
end
