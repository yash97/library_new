class Book < ApplicationRecord
belongs_to :library
has_many :book_history
has_many :bookmarks,dependent: :destroy
validates :title,presence: true
validates :summary,presence: true
validates :isbn,presence: true,uniqueness: true
validates :author, presence: true
validates :published,presence: true
validates :edition,presence: true
validates :language,presence: true

end
