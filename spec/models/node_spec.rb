require 'rails_helper'

RSpec.describe Node, :type => :model do
  describe '#status' do
    it 'after creation, the status is "open"' do
      node = Node.new
      expect(node).to be_open
    end
  end
end
