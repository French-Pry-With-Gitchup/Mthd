class Category < ApplicationRecord
    belongs_to :user
    has_many :topics
    has_many :snippets, through: :topics
    
    validates_presence_of :name, :language, :description, :user_id, on: :create
end
