class Category < ApplicationRecord
    belongs_to :user
    has_many :topics
    has_many :snippets, through: :topics
end
