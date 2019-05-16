class Location < ApplicationRecord
    has_and_belongs_to_one :courses
end
