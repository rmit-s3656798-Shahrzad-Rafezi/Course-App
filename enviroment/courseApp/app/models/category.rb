class Category < ApplicationRecord

    has_many :courses
    has_one :locations

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
end
