class Course < ApplicationRecord
    
    has_many :categories_courses, dependent: :destroy
    has_many :courses_locations, dependent: :destroy
    has_many :categories, through: :categories_courses
    has_many :locations, through: :courses_locations
    # has_and_belongs_to_many :categories
    # has_and_belongs_to_many :location

    # remove optional: true once we figure out why is not passing in
    belongs_to :user, class_name: "User", foreign_key:"user_id", inverse_of: :courses, optional: true
    # has_and_belongs_to_many :votes

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
    validates :prerequisite, presence: true, length: { maximum: 50, minimum: 4 }
    validates :description, presence: true, length: { maximum: 50, minimum: 4 }

end
