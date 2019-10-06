class BookHistory < ApplicationRecord
    belongs_to :student
    belongs_to :book
    validates :is_checked_out,:on_hold, :fine_amt, :is_approved, presence: true
end
