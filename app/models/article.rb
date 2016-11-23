class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
    #dependent: :destroy makes an association between comments & article where if article is destroyed, so are all associated comments of that article
  validates :title, presence: true, length: { minimum: 5 }
end
