class Library < ApplicationRecord
   belongs_to :university
   has_many :books, dependent: :destroy
   has_many :librarians, dependent: :destroy
   validates :name, :university, :location, :borrow_limit, :overdue_fines, presence: true
   validates_uniqueness_of :name, confirmation: { case_sensitive: false } 
end
