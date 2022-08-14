
class GetCheckDigit < ApplicationService

	def initialize(isbn, length_adjustment = 0)
		@isbn = isbn
		@length_adjustment = length_adjustment
	end
	
	def call
		check_digit = CheckDigitComputation.call(@isbn, @length_adjustment)
		return check_digit
	end
end