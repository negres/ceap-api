require 'rails_helper'

RSpec.describe Provider, type: :model do
  context 'creation' do
    it 'does create provider' do
      create(:provider)
      expect(Provider.count).to eq 1
    end
  end
end
