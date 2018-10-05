# Recommended to use a HMT (has many through) instead of a standard join table
class ArticlePublication < ApplicationRecord
  belongs_to :article
  belongs_to :catalog
end
