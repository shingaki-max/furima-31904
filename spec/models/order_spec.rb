require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '出品購入機能' do
    context '購入できる' do
      it '必須項目があれば登録できる' do
        expect(@order).to be_valid
      end
    end

    context '購入できない' do
      it '郵便番号がないため購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県がないため購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be greater than 1")
      end
      it '市区町村がないため購入できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地がないため購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '郵便番号にハイフンがないため購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code need -")
      end
      it '電話番号にハイフンがあるため購入できない' do
        @order.phone_number = '090-1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が12桁のため購入できない' do
        @order.phone_number = '012345678912'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenがないため購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
