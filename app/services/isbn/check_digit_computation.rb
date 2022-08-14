class CheckDigitComputation < ApplicationService

  def initialize isbn, length_adjustment = 1
    @isbn = isbn.remove('-')
    @length_adjustment = length_adjustment
  end

  def call
    type = DetermineType.call(@isbn)
    if type === ISBN_10
      return check_digit_computation_10
    elsif type === ISBN_13
      return check_digit_computation_13
    else
      return ISBN_INVALID
    end
  end
  
  private
  def check_digit_computation_10
    multiplier = 10
    counter = 0
    total = 0
		isbn_10 = @isbn
    while multiplier > 1
      current_num = isbn_10[counter].downcase === "x" ? 10 : isbn_10[counter].to_i
      total += current_num * multiplier
      counter += 1
      multiplier -= 1
    end
    remainder = total % ISBN_10_MODULE
    check_digit = remainder === 0 ? remainder : ISBN_10_MODULE - remainder
		check_digit = check_digit === 10 ? "X" : check_digit
    return check_digit
  end

  def check_digit_computation_13
		counter = 0
		total = 0
		isbn_13 = @isbn
		max_counter = isbn_13.length - @length_adjustment
		while counter < max_counter
			num = isbn_13[counter].to_i
			multiplier = counter.even? ? 1 : 3
			total += num * multiplier
			counter += 1
		end
    remainder = total % ISBN_13_MODULE
    check_digit = remainder === 0 ? remainder : ISBN_13_MODULE - remainder
		check_digit = check_digit === 10 ? "X" : check_digit
    return check_digit
	end
end