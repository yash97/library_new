class University < ApplicationRecord

    # UNIVERSITY_TYPES = ["NCSU","Duke"]

    has_many :libraries
    has_many :students
    has_many :librarians, through: :libraries
end
