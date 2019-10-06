class Book < ApplicationRecord
validates :title,
    :presence => true
validates :isbn,
    :presence => true
validates :summary,
    :presence => true
validates :isbn,
    :presence => true,
    :uniqueness => true
end
