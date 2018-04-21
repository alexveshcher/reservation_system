class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_one :restaurant, through: :table


  validate :proper_minutes
  validate :from_is_less_than_to
  validate :is_not_reserved

  scope :reserved, -> (table,from,to) { where(table: table, from: from..to) }


  private

  def is_not_reserved
    count = Reservation.reserved(table, from, to).count
    if count > 0
      errors.add(:from, 'the table is already reserved: ' + count.to_s)
    end

  end

  def from_is_less_than_to
    if from > to
      errors.add(:from, 'from time should be less than to time')
    end
  end

  def proper_minutes
    allowed_minutes = [0,30]
    if !allowed_minutes.include?(from.min)
      errors.add(:from, 'minutes should equal 0 or 30')
    end
    if !allowed_minutes.include?(to.min)
      errors.add(:to, 'minutes should equal 0 or 30')
    end
  end




end
