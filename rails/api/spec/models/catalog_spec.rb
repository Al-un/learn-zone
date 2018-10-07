# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Catalog, type: :model do

  # Association test
  context 'associations' do
    it { should have_many(:article_publications) }
    it { should have_many(:articles) }
  end
 
  # Definition test
  context 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
  end

end
