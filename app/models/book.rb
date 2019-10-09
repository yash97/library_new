class Book < ApplicationRecord
belongs_to :library
has_many :book_histories
has_many :bookmarks, dependent: :destroy
validates :title, :summary, :author, :published, :edition, :language, presence: true
validates :isbn, presence: true, uniqueness: true

def self.search2(search2)
  where("published LIKE ?", "%#{search2}%")
end
def self.search3(search3)
  where("subject LIKE ?", "%#{search3}%")
end
has_many :book_history
has_many :bookmarks, :dependent => :destroy
validates :title, :presence => true
validates :summary, :presence => true
validates :isbn, :presence => true, :uniqueness => true
validates :author, :presence => true
validates :published, :presence => true
validates :edition, :presence => true
validates :language, :presence => true
validates :quantity,:presence =>true
end
