class Vote < ApplicationRecord

    has_many :courses
    belongs_to :users

end
