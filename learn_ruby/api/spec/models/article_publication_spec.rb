# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ArticlePublication, type: :model do

  # Association test
  context 'associations' do
    it { should belong_to(:article) }
    it { should belong_to(:catalog) }
  end

end
