class Publisher < ApplicationRecord
    # relationships
    has_many :books

    # validations
    validates :name, presence: true
end
