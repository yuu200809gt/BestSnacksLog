require "rails_helper"

RSpec.describe User, type: :model do
  it "全項目正常に入力されている" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前がない場合、無効になる" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールアドレスがない場合、無効になる" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードがない場合、無効になる" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "パスワードと確認用パスワードが一致しない場合、無効になる" do
    user = FactoryBot.build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
end
