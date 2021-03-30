require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'
  it 'nickname,email,password,名前,birthdayが存在すれば登録できる' do
    expect(@user).to be_valid
  end

  describe 'ユーザー新規登録できない時'
  it 'nicknameがからの時登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'emailがからの場合登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'emailに＠が含まれていない場合登録できない' do
    @user.email = 'aaaaaa'
    @user.valid?
  end
  it 'passwordは半角英数字を含めないと登録できない' do
    @user.password = 'aaaaaaa'
    @user.password_confirmation = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password 半角英字と数字の両方を含めて設定してください')
  end
  it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'password6文字未満では登録できない' do
    @user.password = 'a0000'
    @user.password_confirmation = 'a0000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordがからの時に登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが数字のみの場合に登録できない' do
    @user.password = '1234567'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password 半角英字と数字の両方を含めて設定してください')
  end
  it 'passwordが全角の場合に登録できない' do
    @user.password = '1234567全角'
    @user.password_confirmation = '1234567全角'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password 半角英字と数字の両方を含めて設定してください')
  end
  it 'ユーザー本名名字は、全角でないと登録できない' do
    @user.kanji_last_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kanji last name 全角文字を使用してください')
  end
  it 'ユーザー本名名字がからの場合に登録できない' do
    @user.kanji_last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
  end
  it 'ユーザー本名名前は、全角でないと登録できない' do
    @user.kanji_first_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kanji first name 全角文字を使用してください')
  end
  it 'ユーザー本名名前がからの場合に登録できない' do
    @user.kanji_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
  end
  it 'ユーザー本名名字のフリガナは、全角（カタカナ）でないと登録できない' do
    @user.kana_last_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana last name カタカナを使用してください')
  end
  it 'ユーザー本名名字がからの場合に登録できない' do
    @user.kana_last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana last name can't be blank")
  end
  it 'ユーザー本名名前のフリガナは、全角（カタカナ）でないと登録できない' do
    @user.kana_first_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana first name カタカナを使用してください')
  end
  it 'ユーザー本名名前がからの場合に登録できない' do
    @user.kana_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name can't be blank")
  end
  it '生年月日がからの場合に登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
