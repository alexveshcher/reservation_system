require 'rails_helper'

RSpec.describe Reservation, :type => :model do

  let(:user) {  User.create(name: 'Tom') }

  let(:restaurant1) { Restaurant.create(name: 'Some restaurant 1') }
  let(:restaurant2) { Restaurant.create(name: 'Some restaurant 1') }

  let(:schedule1) {
    Schedule.create(
      from: DateTime.now.change(hour: 9, min: 0, sec: 0),
      to: DateTime.now.change(hour: 2, min: 0, sec: 0),
      restaurant: restaurant1
    )
  }

  let(:schedule2) {
    Schedule.create(
      from: DateTime.now.change(hour: 10, min: 0, sec: 0),
      to: DateTime.now.change(hour: 23, min: 0, sec: 0),
      restaurant: restaurant2
    )
  }

  # TODO change this
  def create_tables
    tables1 = []
    5.times do |i|
      tables1 << Table.create(name: "table #{i}", restaurant: restaurant1)
    end

    tables2 = []
    4.times do |i|
      tables2 << Table.create(name: "table #{i}", restaurant: restaurant2)
    end
  end



  let(:reservation) {
    Reservation.create(
      user: user,
      table: Table.first,
      from: DateTime.now.change(hour: 2, min: 0, sec: 0),
      to: DateTime.now.change(hour: 6, min: 30, sec: 0),
    )
  }

  let(:reservation2) {
    Reservation.create(
        user: user,
        table: Table.first,
        from: DateTime.now.change(hour: 4, min: 0, sec: 0),
        to: DateTime.now.change(hour: 7, min: 30, sec: 0),
    )
  }


  it 'scope reserved return 0 reservations when no created' do
    create_tables
    expect(Reservation.reserved(Table.first, DateTime.now, DateTime.now + 1.hour).count).to eq 0
  end

  it 'is valid with valid attributes' do
    create_tables
    expect(reservation).to be_valid
  end

  it "can't reserve the same table for two times" do
    create_tables
    reservation
    expect(reservation2).not_to be_valid
  end

  it "can't reserve if restaurant closing time is less than reservation time" do
  end



end