class Snippet < ApplicationRecord
    belongs_to :user
    has_many :topics
    has_many :categories, through: :topics

    validates_presence_of :title, :code, :user_id, on: :create
    validates_inclusion_of :is_private, :in => [true, false], on: :create
    accepts_nested_attributes_for :topics
end

