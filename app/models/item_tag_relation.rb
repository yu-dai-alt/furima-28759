class ItemTagRelation < ApplicationRecord
  belongs_to :Item
  belongs_to :tag
end
