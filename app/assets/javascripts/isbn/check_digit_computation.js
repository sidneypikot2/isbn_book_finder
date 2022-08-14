var check_digit_computation = (isbn, length_adjustment = 1) => {
  var type = determine_type(isbn)
  if(type === ISBN_10)
    return check_digit_computation_10(isbn)
  else if(type === ISBN_13)
    return check_digit_computation_13(isbn,length_adjustment)
  else {
    return ISBN_INVALID
  }
}
var check_digit_computation_10 = (isbn) => {
  var multiplier = 10
  var counter = 0
  var total = 0
  var isbn_10 = isbn.replaceAll('-', '')
  while(multiplier > 1) {
    var current_num = isbn_10[counter].downcase === "x" ? 10 : parseInt(isbn_10[counter])
    total += current_num * multiplier
    counter += 1
    multiplier -= 1
  }
  remainder = total % ISBN_10_MODULE
  check_digit = remainder === 0 ? remainder : ISBN_10_MODULE - remainder
  check_digit = check_digit === 10 ? "X" : check_digit
  return check_digit
}

var check_digit_computation_13 = (isbn,length_adjustment) => {
  var counter = 0
  var total = 0
  var isbn_13 = isbn.replaceAll('-', '')
  var max_counter = isbn_13.length - length_adjustment
  while( counter < max_counter) {
    num = parseInt(isbn_13[counter])
    var multiplier = counter%2 == 0 ? 1 : 3
    total += num * multiplier
    counter += 1
  }
  var remainder = total % ISBN_13_MODULE
  var check_digit = remainder === 0 ? remainder : ISBN_13_MODULE - remainder
  check_digit = check_digit === 10 ? "X" : check_digit
  return check_digit
}


  