class Provider < ApplicationRecord
has_many :saveds
has_many :users, through: :saveds
end
