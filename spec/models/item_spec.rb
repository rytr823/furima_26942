require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { FactoryBot.create(:user) }
  describe '#create' do
    before do
      @item = build(:item)
    end

    # 全てのカラムが存在すれば登録できること
    it 'is valid with all column' do
      expect(@item).to be_valid
    end

    # imageが空であれば登録できないこと
    it 'is invalid without a image' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("を入力してください")
    end

    # nameが空であれば登録できないこと
    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("を入力してください")
    end

    # introductionが空であれば登録できないこと
    it 'is invalid without a introduction' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors[:introduction]).to include("を入力してください")
    end

    # priceが空であれば登録できないこと
    it 'is invalid without a price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("を入力してください")
    end

    # sales_commissionが空であれば登録できないこと
    it 'is invalid without a sales_commission' do
      @item.sales_commission = nil
      @item.valid?
      expect(@item.errors[:sales_commission]).to include("を入力してください")
    end

    # sales_profitが空であれば登録できないこと
    it 'is invalid without a sales_profit' do
      @item.sales_profit = nil
      @item.valid?
      expect(@item.errors[:sales_profit]).to include("を入力してください")
    end

    # category_idが空であれば登録できないこと
    it 'is invalid without a category_id' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors[:category_id]).to include("を入力してください", "は数値で入力してください")
    end

    # status_idが空であれば登録できないこと
    it 'is invalid without a status_id' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors[:status_id]).to include("を入力してください", "は数値で入力してください")
    end

    # postage_pay_idが空であれば登録できないこと
    it 'is invalid without a postage_pay_id' do
      @item.postage_pay_id = nil
      @item.valid?
      expect(@item.errors[:postage_pay_id]).to include("を入力してください", "は数値で入力してください")
    end

    # shipping_area_idが空であれば登録できないこと
    it 'is invalid without a shipping_area_id' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors[:shipping_area_id]).to include("を入力してください")
    end

    # days_until_shipping_idが空であれば登録できないこと
    it 'is invalid without a days_until_shipping_id' do
      @item.days_until_shipping_id = nil
      @item.valid?
      expect(@item.errors[:days_until_shipping_id]).to include("を入力してください", "は数値で入力してください")
    end

    # userが空であれば登録できないこと
    it 'is invalid without a user_id' do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include("を入力してください", "を入力してください")
    end

    # priceの範囲が、¥300~¥9,999,999の間でなければ登録できること
    it 'is valid with the price range is between ¥300 and ¥9,999,999' do
      @item.price = '1000'
      expect(@item).to be_valid
    end

    # priceの範囲が、¥300~¥9,999,999の間でなければ登録できないこと
    it 'is invalid without the price range is between ¥300 and ¥9,999,999' do
      @item.price = '10'
      @item.valid?
      expect(@item.errors[:price]).to include('は一覧にありません')
    end
  end
end
