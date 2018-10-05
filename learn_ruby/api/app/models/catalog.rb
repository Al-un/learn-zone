class Catalog < ApplicationRecord

  # associations
  has_many :article_publications
  has_many :articles, through: :article_publications

  # validations
  validates_presence_of :code, :name

end
