require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the name and price of all snacks in that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    skittles = dons.snacks.create(name: "Skittles", cost: "2.00")
    starburst = dons.snacks.create(name: "Starburst", cost: "1.00")
    snickers = dons.snacks.create(name: "Snickers", cost: "1.50")

    visit machine_path(dons)

    within "#id-#{skittles.id}" do
      expect(page).to have_content(skittles.name)
      expect(page).to have_content(skittles.cost)
    end
    within "#id-#{starburst.id}" do
      expect(page).to have_content(starburst.name)
      expect(page).to have_content(starburst.cost)
    end

    within "#id-#{snickers.id}" do
      expect(page).to have_content(snickers.name)
      expect(page).to have_content(snickers.cost)
    end
  end

  scenario "they see the name and price of all snacks in that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    skittles = dons.snacks.create(name: "Skittles", cost: "2.00")
    starburst = dons.snacks.create(name: "Starburst", cost: "1.00")
    snickers = dons.snacks.create(name: "Snickers", cost: "1.50")

    visit machine_path(dons)

    within ".avg_item_cost" do
      expect(page).to have_content("Average Snack Cost: $3.00")
    end
  end
end
