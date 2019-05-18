class Category < ApplicationRecord

    belongs_to :courses
    has_and_belongs_to_many :locations

end
