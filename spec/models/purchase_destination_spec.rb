require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(
      :purchase_destination, user_id: user.id, item_id: item.id
    )
    sleep(0.1)
  end

  describe '購入情報の保存' do

    context '内容に問題がない場合' do
      it '全てのフォームが正しく入力されていれば保存できる' do
        expect(@purchase_destination).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @purchase_destination.post_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが数字だけでは保存できない' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'prefecture_idが1だと保存できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと保存できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("市町村名を入力してください")
      end
      it 'blockが空だと保存できない' do
        @purchase_destination.block = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが10桁以下では保存できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角では保存できない' do
        @purchase_destination.phone_number = '１２３４５６７８９１０'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'userが紐づいていないと保存できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいていないと保存できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では保存できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end

  end
end
