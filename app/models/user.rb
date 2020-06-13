class User < ApplicationRecord
    has_many :categories
    has_many :snippets
end
