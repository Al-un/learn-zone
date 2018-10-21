class Catalog < ApplicationRecord

  # associations
  has_many :article_publications, inverse_of: :catalog, dependent: :destroy
  has_many :articles, through: :article_publications 
  accepts_nested_attributes_for :article_publications, allow_destroy: true
  accepts_nested_attributes_for :articles

  # validations
  validates_presence_of :code, :name

end
