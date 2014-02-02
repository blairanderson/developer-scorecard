require 'spec_helper'

describe Connection do
  describe 'associations' do
    it { should belong_to :user }
    it { should have_many(:stats).dependent(:destroy) }
  end
end
