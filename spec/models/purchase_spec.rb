require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    before do
      @purchase = build(:purchase)
    end
    
    #全てのカラムが存在すれば登録できること
    it 'is valid all column' do
      expect(@purchase).to be_valid
    end
    
    #userが空であれば登録できないこと
    it 'is invalid without a user_id' do
      @purchase.user = nil
      @purchase.valid?
      expect(@purchase.errors[:user]).to include("must exist")
    end

    #itemが空であれば登録できないこと
    it 'is invalid without a item_id' do
      @purchase.item = nil
      @purchase.valid?
      expect(@purchase.errors[:item]).to include("must exist")
    end
  end
end
