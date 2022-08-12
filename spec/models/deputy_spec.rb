require 'rails_helper'

RSpec.describe Deputy, type: :model do
  context 'creation' do
    it 'does create deputy' do
      create(:deputy)
      expect(Deputy.count).to eq 1
    end
  end
end
