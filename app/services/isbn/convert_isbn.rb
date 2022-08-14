class ConvertIsbn < ApplicationService

	def initialize(isbn)
		@isbn = isbn.remove('-')
	end
	
	def call
		type = DetermineType.call(@isbn)
		if type === ISBN_10
			output = convert_10_to_13
		elsif type === ISBN_13
			output = convert_13_to_10
		else
			return type
		end
		return FormatIsbn.call(output)
	end

	private
	def convert_10_to_13
		output = "978" + @isbn.at(0..@isbn.length-2)
		check_digit = GetCheckDigit.call(output)
		return output.to_s + check_digit.to_s
	end

	def convert_13_to_10
		output = @isbn.at(3..@isbn.length-2)
		check_digit = GetCheckDigit.call(output)
		return output.to_s + check_digit.to_s
	end
end