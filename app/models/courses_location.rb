class CoursesLocation < ApplicationRecord
  belongs_to :location
  belongs_to :course
end
