class Library < ApplicationRecord
   belongs_to :university
   has_many :books, dependent: :destroy
   has_many :librarians, dependent: :destroy
   validates :name, :university, :location, :max_days, :fine_per_day, presence: true
   validates_uniquenss_of :name, confirmation: { case_sensitive: false } 
end
