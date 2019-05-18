class Course < ApplicationRecord

    belongs_to :categories
    belongs_to :location
    belongs_to :users

end
