
class FormatIsbn < ApplicationService

	def initialize(isbn)
		@isbn = isbn.remove("-")
	end
	
	def call
		if @isbn.length === 10
      return format_isbn10
    else
      return format_isbn13
		end
	end
  private
  def format_isbn10 
    return insert_dashes [1,5,11]
  end
  def format_isbn13 
    return insert_dashes [3,5,12,15]
  end
  def insert_dashes arr_index
    isbn = @isbn
    arr_index.each do |index|
      isbn = isbn.insert(index, "-")
    end
    return isbn
  end
end