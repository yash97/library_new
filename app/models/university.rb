class University < ApplicationRecord

    #UNIVERSITY_OPTIONS =["NCSU","Duke","Clemson","UNCC"]

    has_many :libraries
    has_many :students
    has_many :librarians, through: :libraries
end
