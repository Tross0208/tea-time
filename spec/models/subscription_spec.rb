require 'rails_helper'

RSpec.describe Subscription do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_many :teas}
  end

  describe 'validations' do
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency}
    it { should validate_presence_of :title }
  end
end
