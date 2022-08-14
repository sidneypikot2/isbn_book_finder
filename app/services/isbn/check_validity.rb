class CheckValidity < ApplicationService

	def initialize(isbn)
		@isbn = isbn
	end
	
	def call
		check_digit = CheckDigitComputation.call(@isbn)
		return @isbn.last === check_digit.to_s
	end
end