require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:item) { FactoryBot.create(:item) }
  describe '#create' do
    before do
      @address = build(:address)
    end

    # building_name以外のカラムが存在すれば登録できること
    it 'is valid with a column other than the building name' do
      expect(@address).to be_valid
    end

    # postal_codeが空であれば登録できないこと
    it 'is invalid without a postal_code' do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors[:postal_code]).to include("can't be blank")
    end

    # prefecture_idが空であれば登録できないこと
    it 'is invalid without a prefecture_id' do
      @address.prefecture_id = nil
      @address.valid?
      expect(@address.errors[:prefecture_id]).to include("can't be blank")
    end

    # cityが空であれば登録できないこと
    it 'is invalid without a city' do
      @address.city = nil
      @address.valid?
      expect(@address.errors[:city]).to include("can't be blank")
    end

    # addressが空であれば登録できないこと
    it 'is invalid without a address' do
      @address.address = nil
      @address.valid?
      expect(@address.errors[:address]).to include("can't be blank")
    end

    # phone_numberが空であれば登録できないこと
    it 'is invalid without a phone_number' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors[:phone_number]).to include("can't be blank")
    end

    # item_idが空であれば登録できないこと
    it 'is invalid without a item' do
      @address.item = nil
      @address.valid?
      expect(@address.errors[:item]).to include('must exist')
    end

    # postage_codeにはハイフンが無ければ登録できないこと
    it 'is invalid without a - ' do
      @address.postal_code = '1234567'
      @address.valid?
      expect(@address.errors[:postal_code]).to include('is invalid')
    end

    # phone_numberはハイフン不要で11桁以内でないと登録できないこと
    it 'is invalid wothout no hyphens required and within 11 digits' do
      @address.phone_number = '123456789101112'
      @address.valid?
      expect(@address.errors[:phone_number]).to include('は11桁以内で入力してください')
    end
  end
end
