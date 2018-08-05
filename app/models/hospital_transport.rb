class HospitalTransport < ApplicationRecord
  acts_as_paranoid

  belongs_to :hospital
  belongs_to :transport

  validates :transport_cost, presence: true, numericality:
    {only_integer: true, greater_than_or_equal_to: 0}
end
