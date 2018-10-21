class Article < ApplicationRecord

  # associations
  has_many :article_publications, inverse_of: :article, dependent: :destroy
  has_many :catalogs, through: :article_publications

  # validations
  validates_presence_of :name

end
