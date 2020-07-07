require 'rails_helper'

describe User do
  describe '#create' do
    # 全てのカラムが存在すれば登録できる
    it 'is valid without all column' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    # nicknameが空では登録できないこと
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # emailが空では登録できないこと
    it 'is invalid without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # family_nameが空では登録できないこと
    it 'is invalid without a family_name' do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    # last_nameが空では登録できないこと
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # family_name_katakanaが空では登録できないこと
    it 'is invalid without a family_name_katakana' do
      user = build(:user, family_name_katakana: nil)
      user.valid?
      expect(user.errors[:family_name_katakana]).to include("can't be blank")
    end

    # last_name_katakanaが空では登録できないこと
    it 'is invalid without a last_name_katakana' do
      user = build(:user, last_name_katakana: nil)
      user.valid?
      expect(user.errors[:last_name_katakana]).to include("can't be blank")
    end

    # birthdayが空では登録できないこと
    it 'is invalid without a birthday' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 重複したemailが存在する場合は登録できないこと
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    # emailが@を含まない場合登録できないこと
    it 'is invalid with a email contains @' do
      user = build(:user, email: 'aaagmail.com')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    # passwordが6字以上であること
    it 'is valid with a password that has more than 6 characters' do
      user = build(:user, password: 'a00000', password_confirmation: 'a00000')
      user.valid?
      expect(user).to be_valid
    end

    # passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters' do
      user = build(:user, password: 'a0000', password_confirmation: 'a0000')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    # passwordが半角英数時混合以外であれば登録できないこと
    it 'is invalid without a password except mixed with half-width alphanumeric characters' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors[:password]).to include('は半角英数字混合で入力してください。')
    end

    # family_name_katakanaがカタカナ以外は登録できないこと
    it 'is invalid without a family_name_katakana except katakana' do
      user = build(:user, family_name_katakana: 'kana')
      user.valid?
      expect(user.errors[:family_name_katakana]).to include('はカタカナで入力して下さい。')
    end

    # last_name_katakanaがカタカナ以外は登録できないこと
    it 'is invalid without a last_name_katakana except katakana' do
      user = build(:user, last_name_katakana: 'kana')
      user.valid?
      expect(user.errors[:last_name_katakana]).to include('はカタカナで入力して下さい。')
    end
  end
end
