class Category < ApplicationRecord

    has_and_belongs_to_many :courses
    has_and_belongs_to_many :locations

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
end
