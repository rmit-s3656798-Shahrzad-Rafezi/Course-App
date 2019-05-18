class Course < ApplicationRecord

    has_many :categories
    belongs_to :location
    belongs_to :users
    belongs_to :votes

end
