# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# create authors
  authors = [
    {first_name: "Joel", last_name: "Hartse"},
    {first_name: "Hannah", last_name: "Templer", middle_name: "P."},
    {first_name: "Marguerite", last_name: "Duras", middle_name: "Z."},
    {first_name: "Kingsley", last_name: "Amis"},
    {first_name: "Fannie", last_name: "Flagg", middle_name: "Peters"},
    {first_name: "Iceberg", last_name: "Slim", middle_name: "Nash"},
    {first_name: "Camille", last_name: "Paglia", middle_name: "Byron"},
    {first_name: "Rainer", last_name: "Rilke", middle_name: "Steel"},
    {first_name: "Baroness", last_name: "Orczy", middle_name: "A."},
    {first_name: "Pablo", last_name: "Neruda", middle_name: "Rowling"},
    {first_name: "Hunter", last_name: "Thompson", middle_name: "Thackeray"},
    {first_name: "Ezra", last_name: "Pound", middle_name: "B."},
    {first_name: "Tennessee", last_name: "Williams", middle_name: "Kingsolver"},
    {first_name: "Willa", last_name: "Cather"}
  ]
  authors.each do |author|
    author = Author.new(author)
    author.valid?
    author.save
  end

# create publishers
  publishers = [
    { name: "Paste Magazine" },
    { name: "Publishers Weekly" },
    { name: "Graywolf Presss" },
    { name: "Hanging Loose Pres" },
    { name: "McSweeney's" }
  ]
  publishers.each do |publisher|
    publisher = Publisher.new(publisher)
    publisher.valid?
    publisher.save
  end

# create books
  p_ids = Publisher.all.pluck(:id) # there are 5 publishers
  books = [
    { title: "American Elf", isbn: "978-1-891830-85-3", image_url: 'https://www.topshelfcomix.com/catalog/covers/americanelfvol2_lg.jpg',publication_year: "2004", price: 1000, edition: "Book 2", publisher_id: p_ids[0]},
    { title: "Cosmoknights", isbn: "978-1-60309-454-2", image_url: 'https://www.topshelfcomix.com/catalog/covers/cosmoknights_book_one_cover_sm_lg.jpg', publication_year: "2019", price: 2000, edition: "Book 1", publisher_id: p_ids[1]},
    { title: "Essex County", isbn: "978-1-60309-038-4", image_url: 'https://www.topshelfcomix.com/catalog/covers/essexcountysoftcover_lg.gif', publication_year: "1990", price: 500, publisher_id: p_ids[2]},
    { title: "Hey, Mister (Vol 1)", isbn: "978-1-891830-02-0", image_url: 'https://www.topshelfcomix.com/catalog/hey-mister-vol-1-after-school-spec/13', publication_year: "2000",price: 1200, edition: "After School Special", publisher_id: p_ids[2]},
    { title: "The Underwater Welder", isbn: "978-1-60309-398-9", image_url: 'https://www.topshelfcomix.com/catalog/covers/welder_hc_cover_sm_copy0_lg.jpg', publication_year: "2022",price: 3000, publisher_id: p_ids[4]},
    { title: "The Bend of Luck", isbn: "978-1-60309-509-9", image_url: 'https://www.topshelfcomix.com/catalog/covers/the_bend_of_luck_cover_sm_lg.jpg', publication_year: "2022",price: 2100, publisher_id: p_ids[3]},
    { title: "Doughnuts and Doom", isbn: "978-1-60309-513-6", image_url: 'https://www.topshelfcomix.com/catalog/covers/doughnuts_and_doom_cover_sm_lg.jpg', publication_year: "2022",price: 100, edition: "Book 3", publisher_id: p_ids[4]}
  ]
  books.each do |book|
    book = Book.new(book)
    book.isbn = FormatIsbn.call(book.isbn)
    book.valid?
    book.save
  end

# create book_authors
  b_ids = Book.all.pluck(:id) # there are 7 books
  a_ids = Author.all.pluck(:id) # there are 14 authors
  book_authors = [
    { book_id: b_ids[0], author_id: a_ids[0]},
    { book_id: b_ids[0], author_id: a_ids[1]},
    { book_id: b_ids[0], author_id: a_ids[2]},
    { book_id: b_ids[1], author_id: a_ids[3]},
    { book_id: b_ids[2], author_id: a_ids[3]},
    { book_id: b_ids[4], author_id: a_ids[7]},
    { book_id: b_ids[3], author_id: a_ids[4]},
    { book_id: b_ids[3], author_id: a_ids[6]},
    { book_id: b_ids[3], author_id: a_ids[1]},
    { book_id: b_ids[5], author_id: a_ids[8]},
    { book_id: b_ids[6], author_id: a_ids[5]},
    { book_id: b_ids[6], author_id: a_ids[6]},
    { book_id: b_ids[6], author_id: a_ids[1]},
    { book_id: b_ids[6], author_id: a_ids[2]},
  ]

  book_authors.each do |book_author|
    book_author = BookAuthor.new(book_author)
    book_author.valid?
    book_author.save
  end