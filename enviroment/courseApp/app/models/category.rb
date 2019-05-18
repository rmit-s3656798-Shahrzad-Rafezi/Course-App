class Category < ApplicationRecord

    belongs_to :courses
    has_and_belongs_to_many :locations

    validates :name, presence: true, length: { maximum: 50, minimum: 4 }
end
