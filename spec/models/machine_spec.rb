require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many :snack_machines }
    it { should have_many(:snacks).through(:snack_machines) }
  end

  describe "instance methods" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    skittles = dons.snacks.create(name: "Skittles", cost: "2.00")
    starburst = dons.snacks.create(name: "Starburst", cost: "1.00")
    snickers = dons.snacks.create(name: "Snickers", cost: "1.50")

    expect(dons.average_price).to eq(3)
  end
end
