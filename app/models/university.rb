class University < ApplicationRecord

    # UNIVERSITY_OPTIONS =[ ["NCSU", 1], ["Duke",2], ["Clemson",3], ["UNCC",4]]

    has_many :libraries
    has_many :students
    has_many :librarians, through: :libraries
end
