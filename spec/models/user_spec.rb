require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "まる",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000",first_name: "まる",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "emailに@がふくまれていないと登録できない" do
      user = User.new(nickname: "abe", email: "kkkgmail.com", password: "00000000", password_confirmation: "00000000",first_name: "まる",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
      binding.pry
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000",first_name: "まる",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "passwordが半角英数字混合でないと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "まる",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "",first_name: "まる",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "",last_name: "さんかく",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "まる",last_name: "",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "まる",last_name: "さんかく",first_name_kana: "", last_name_kana: "サンカク", birth_date: "19980808")
      user.valid?
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "",last_name: "",first_name_kana: "マル", last_name_kana: "", birth_date: "19980808")
      user.valid?
    end
    it "birth_dateが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name: "",last_name: "",first_name_kana: "マル", last_name_kana: "サンカク", birth_date: "")
      user.valid?
    end
  end
end
