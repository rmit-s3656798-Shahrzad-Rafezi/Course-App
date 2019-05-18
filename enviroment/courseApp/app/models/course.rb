class Course < ApplicationRecord

    has_many :categories
    belongs_to :location
    belongs_to :users
    belongs_to :votes

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
    validates :prerequisite, presence: true, length: { maximum: 50, minimum: 4 }
    validates :description, presence: true, length: { maximum: 50, minimum: 4 }

end
