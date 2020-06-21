class Topic < ApplicationRecord
    belongs_to :category
    belongs_to :snippet

    validates_presence_of :category_id, :snippet_id
end
