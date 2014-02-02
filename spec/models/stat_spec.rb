require 'spec_helper'

describe Stat do
  
  describe 'validations' do
    it { should validate_presence_of :connection_id}
    it { should validate_presence_of :type_cd }
    it { should validate_presence_of :event}
    it { should validate_numericality_of :connection_id }
    it { should validate_numericality_of :type_cd }
  end

  describe 'associations' do
    it { should belong_to(:connection).touch(true) }
  end
end
