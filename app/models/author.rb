class Author < ApplicationRecord
  # relationships
  has_many :book_authors
	has_many :books, through: :book_authors

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.middle_name ? self.middle_name + " " : ""}#{self.last_name}"
  end
end
