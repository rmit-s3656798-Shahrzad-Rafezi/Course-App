class Location < ApplicationRecord

    has_many :courses

    VALID_LOCATION_REGEX = /\A\d*[.]\d*[.]\d*\z/
    validates :name, presence: true, format: { with: VALID_LOCATION_REGEX, message: "The format for location should be like this 00.01.12"}

end
