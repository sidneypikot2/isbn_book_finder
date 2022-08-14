json.book do
  json.isbn @book.isbn
  json.title @book.title
  json.author @book.authors.collect {|author| author.full_name}
  json.publisher @book.publisher.name
  json.publication_year @book.publication_year
  json.price @book.display_price
  json.edition @book.edition
end
