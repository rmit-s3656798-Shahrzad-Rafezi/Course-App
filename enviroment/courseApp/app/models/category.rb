class Category < ApplicationRecord

    has_many :categories_courses
    has_many :courses, through: :categories_courses
    # has_and_belongs_to_many :courses

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
end
