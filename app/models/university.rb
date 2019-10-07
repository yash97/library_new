class University < ApplicationRecord

    university_options = ["NCSU", "Duke", "Clemson", "UNCC"]

    has_many :libraries
    has_many :students
    has_many :librarians, through: :libraries
end
