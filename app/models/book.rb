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
has_one_attached :cover

end