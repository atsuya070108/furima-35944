require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録がうまくいくとき' do
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end
  it 'passwordが6文字以上であれば登録できること' do
    @user.password = 'atsuya0108'
    @user.password_confirmation = 'atsuya0108'
    expect(@user).to be_valid
  end
end
  context '新規登録がうまくいかないとき' do
    it 'nicknameがない場合は登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

  it 'emailがない場合は登録できないこと' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Email can't be blank"
  end

  it 'emailには「@」を含む必要があること' do
     @user.email = 'hogehuga.com'
     @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end


  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'passwordがない場合は登録できないこと' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordが半角英数字混合でなければ登録できない' do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
  end

   it'passwordが半角数字のみでは登録できない' do
   @user.password = '111111'
   @user.valid?
   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

    it 'passwordが全角では登録できない' do
      @user.password = 'ああああ１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


  it 'password_confirmationがない場合は登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'passwordが存在してもpassword_confirmationがない場合は登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'passwordが5文字以下であれば登録できないこと' do
    @user.password = '12345'
    @user.password_confirmation = '12345'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'first_nameがない場合は登録できない' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')
  end

  it 'last_nameがない場合は登録できないこと' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid')
  end

  it 'first_nameが全角入力でなければ登録できないこと' do
    @user.first_name = 'kana'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')
  end

  it 'last_nameが全角入力でなければ登録できないこと' do
    @user.last_name = 'kana'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid')
  end

  it 'first_name_kanaが空だと登録できない' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')
  end

  it 'last_name_kanaが空だと登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid')
  end
  it 'first_name_kanaが全角カタカナでなければ登録できない' do
    @user.first_name_kana = 'あいうえお'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')
  end
  it 'last_name_kanaが全角カタカナでなければ登録できない' do
    @user.last_name_kana = 'あいうえお'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid')
  end
  it '生年月日が空だと登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
end