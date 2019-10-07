class Book < ApplicationRecord
belongs_to :library
has_many :book_histories
has_many :bookmarks, dependent: :destroy
validates :title, :summary, :author, :published, :edition, :language, presence: true
validates :isbn, presence: true, uniqueness: true

end
