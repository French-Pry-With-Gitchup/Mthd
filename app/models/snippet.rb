class Snippet < ApplicationRecord
    belongs_to :user
    has_many :topics
    has_many :categories, through: :topics
end
