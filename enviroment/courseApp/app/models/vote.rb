class Vote < ApplicationRecord
    has_and_belongs_to_many :courses
    has_and_belongs_to_one :users
end
