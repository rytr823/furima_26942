require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:item) { FactoryBot.create(:item) }
  describe '#create' do
    before do
      @card = build(:card)
    end

    #全てのカラムが存在すれば登録できること
    it 'is valid all column' do
      expect(@card).to be_valid
    end
    
    #card_tokenが空であれば登録できないこと
    it 'is invalid without a card_token' do
      @card.card_token = nil
      @card.valid?
      expect(@card.errors[:card_token]).to include("can't be blank")
    end
    
    #itemが空であれば登録できないこと
    it 'is invalid without a item_id' do
      @card.item = nil
      @card.valid?
      expect(@card.errors[:item]).to include("must exist")
    end
  end
end

