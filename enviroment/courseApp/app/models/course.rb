class Course < ApplicationRecord
    has_and_belongs_to_many :locations
    has_and_belongs_to_one :categories
    has_and_belongs_to_many :users
end
