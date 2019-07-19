class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cost

  has_many :snack_machines
  has_many :machines, through: :snack_machines
end
