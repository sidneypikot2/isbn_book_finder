class Book < ApplicationRecord
	# relationships
  has_many :book_authors
	has_many :authors, through: :book_authors
	belongs_to :publisher
	
	# validations
	validates :title, presence: true
  validates :publication_year, presence: true
  validates :isbn, presence: true
	validates_associated :authors

	def display_price
		"PHP #{price.round(2)}"
	end
end