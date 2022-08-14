class DetermineType < ApplicationService
  def initialize isbn
    @isbn = isbn.remove('-')
  end

  def call
    case @isbn.length
    when 9..10
      ISBN_10
    when 12..13
      ISBN_13
    else
      ISBN_INVALID
    end
  end
end