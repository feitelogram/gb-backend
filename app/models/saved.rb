class Saved < ApplicationRecord
    belongs_to :user
    belongs_to :provider
    has_many :appointments
end
