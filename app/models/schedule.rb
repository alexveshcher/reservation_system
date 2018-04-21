class Schedule < ApplicationRecord
  belongs_to :restaurant

  validates_uniqueness_of :restaurant_id


  def self.open(time)

    if from > to
      to += 24
      time.hour.between?(from, to)
    else
      time.hour.between?(from, to)
    end

  end

end
