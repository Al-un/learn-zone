class Article < ApplicationRecord

  # associations
  has_many :article_publications
  has_many :catalogs, through: :article_publications

  # validations
  validates_presence_of :name

end
