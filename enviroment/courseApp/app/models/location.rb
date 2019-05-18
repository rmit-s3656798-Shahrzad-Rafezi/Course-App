class Location < ApplicationRecord

    has_many :courses
    has_and_belongs_to_many :categories

end
