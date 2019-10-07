class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :university
  has_many :book_histories, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :university, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email, uniqueness: :message
  validates :password, presence: true, length:{minimum:8}, confirmation: true
  
  education_level_options = %w(Undergraduate Masters PhD)
  validates :education_level, :inclusion => {:in => education_level_options}

  # enum maximum_books: {Undergraduate: 2, Masters: 4, PhD: 6}
  # self.max_books = maximum_books[education_level]
  
end
