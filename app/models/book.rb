class Book < ApplicationRecord
belongs_to :library
validates :title,:presence=> true
validates :summary,:presence=> true
def self.search(search)
  where("title LIKE ?", "%#{search}%")
end
def self.search1(search1)
  where("author LIKE ?", "%#{search1}%")
end

def self.search2(search2)
  where("published LIKE ?", "%#{search2}%")
end
def self.search3(search3)
  where("subject LIKE ?", "%#{search3}%")
end
validates :isbn,:presence=> true,:uniqueness=> true
validates :author, :presence=> true
validates :published,:presence=> true
validates :edition,:presence=> true
validates :language,:presence=> true

end
