var determine_type = (isbn) => {
  isbn = isbn.replaceAll("-","");
  var length = isbn.length;
  var output = ISBN_INVALID
  switch(true) {
    case (length >= 9 && length <= 10):
      output = ISBN_10
      break
    case (length >= 12 && length <= 13):
      output = ISBN_13
  }
  return output
}