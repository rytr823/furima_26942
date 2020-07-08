require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    # 全てのカラムが存在すれば登録できること
    it 'is valid with all column' do
      item = build(:item)
      expect(item).to be_valid
    end

    # imageが空であれば登録できないこと
    it 'is invalid without a image' do
      item = build(:item)
      item.image = nil
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end

    # nameが空であれば登録できないこと
    it 'is invalid without a name' do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # introductionが空であれば登録できないこと
    it 'is invalid without a introduction' do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    # priceが空であれば登録できないこと
    it 'is invalid without a price' do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # sales_commissionが空であれば登録できないこと
    it 'is invalid without a sales_commission' do
      item = build(:item, sales_commission: nil)
      item.valid?
      expect(item.errors[:sales_commission]).to include("can't be blank")
    end

    # sales_profitが空であれば登録できないこと
    it 'is invalid without a sales_profit' do
      item = build(:item, sales_profit: nil)
      item.valid?
      expect(item.errors[:sales_profit]).to include("can't be blank")
    end

    # category_idが空であれば登録できないこと
    it 'is invalid without a category_id' do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    # status_idが空であれば登録できないこと
    it 'is invalid without a status_id' do
      item = build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    # postage_pay_idが空であれば登録できないこと
    it 'is invalid without a postage_pay_id' do
      item = build(:item, postage_pay_id: nil)
      item.valid?
      expect(item.errors[:postage_pay_id]).to include("can't be blank")
    end

    # shipping_area_idが空であれば登録できないこと
    it 'is invalid without a shipping_area_id' do
      item = build(:item, shipping_area_id: nil)
      item.valid?
      expect(item.errors[:shipping_area_id]).to include("can't be blank")
    end

    # days_until_shipping_idが空であれば登録できないこと
    it 'is invalid without a days_until_shipping_id' do
      item = build(:item, days_until_shipping_id: nil)
      item.valid?
      expect(item.errors[:days_until_shipping_id]).to include("can't be blank")
    end

    # priceの範囲が、¥300~¥9,999,999の間でなければ登録できること
    it 'is valid with the price range is between ¥300 and ¥9,999,999' do
      item = build(:item, price: '1000')
      expect(item).to be_valid
    end

    # priceの範囲が、¥300~¥9,999,999の間でなければ登録できないこと
    it 'is invalid without the price range is between ¥300 and ¥9,999,999' do
      item = build(:item, price: '10')
      item.valid?
      expect(item.errors[:price]).to include('is not included in the list')
    end
  end
end
