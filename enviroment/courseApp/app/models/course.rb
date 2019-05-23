class Course < ApplicationRecord

    has_and_belongs_to_many :categories
    has_and_belongs_to_many :location
    has_and_belongs_to_many :users

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
    validates :prerequisite, presence: true, length: { maximum: 50, minimum: 4 }
    validates :description, presence: true, length: { maximum: 50, minimum: 4 }

end
