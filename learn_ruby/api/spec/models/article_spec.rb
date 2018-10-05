# frozen_string_literal: true
require 'rails_helper'

# Testing article model
RSpec.describe Article, type: :model do

  # Association test
  # none

  # Definition test
  # it { should validates_presence_of(:name) }
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

end
