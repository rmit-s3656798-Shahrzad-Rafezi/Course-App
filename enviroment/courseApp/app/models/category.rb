class Category < ApplicationRecord

    has_many :categories_courses
    has_many :courses, through: :categories_courses

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
end
