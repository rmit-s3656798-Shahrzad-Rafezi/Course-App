class Course < ApplicationRecord
    
    belongs_to :category
    belongs_to :location
    # has_and_belongs_to_many :categories
    # has_and_belongs_to_many :location
    has_and_belongs_to_many :users
    # has_and_belongs_to_many :votes

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
    validates :prerequisite, presence: true, length: { maximum: 50, minimum: 4 }
    validates :description, presence: true, length: { maximum: 50, minimum: 4 }

end
