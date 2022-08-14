var check_validity = (isbn) => {
  check_digit = check_digit_computation(isbn)
  return isbn.slice(-1) == check_digit
}