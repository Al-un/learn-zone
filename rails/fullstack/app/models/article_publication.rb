class ArticlePublication < ApplicationRecord
  belongs_to :article
  belongs_to :catalog
end
