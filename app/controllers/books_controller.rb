class BooksController < ApplicationController
  before_action :get_book, only: [:search]
  def show
  end
  def search
    respond_to do |format|
      format.json do 
        if @book 
          @book
        else
          render json: { message: @message, status: @status },:status => @status
        end
      end
      format.js do
        render :status => @status, :text => @message, message: @message
      end
    end
  end
  private
  def get_book
    isbn = params[:isbn]
    type = DetermineType.call(isbn)
    @status = 200
    if type != ISBN_INVALID
      is_valid = CheckValidity.call(isbn)
      if is_valid
        if type === ISBN_10
          isbn = ConvertIsbn.call(isbn)      
        end
        isbn = FormatIsbn.call(isbn)
        @book = Book.where(isbn: isbn).first
        if !@book
          @message = BOOK_NOT_FOUND
          @status = BOOK_NOT_FOUND_STATUS
        end
      else
        @message = INVALID_ISBN_MESSAGE
        @status = INVALID_ISBN_STATUS
      end
    else
      @message = INVALID_ISBN_MESSAGE
      @status = INVALID_ISBN_STATUS
    end
  end
end