require "rails_helper"

RSpec.describe Snack, type: :model do
  it "全項目正常に入力されている" do
    snack = FactoryBot.build(:snack)
    expect(snack).to be_valid
  end

  it "おつまみ名がない場合、無効になる" do
    snack = FactoryBot.build(:snack, name: nil)
    snack.valid?
    expect(snack.errors[:name]).to include("を入力してください")
  end

  it "合うお酒がない場合、無効になる" do
    snack = FactoryBot.build(:snack, best_alcohol: nil)
    snack.valid?
    expect(snack.errors[:best_alcohol]).to include("を入力してください")
  end

  it "食べ物のカテゴリがない場合、無効になる" do
    snack = FactoryBot.build(:snack, food_types: nil)
    snack.valid?
    expect(snack.errors[:food_types]).to include("を入力してください")
  end

  it "おつまみの詳細がない場合、無効になる" do
    snack = FactoryBot.build(:snack, memo: nil)
    snack.valid?
    expect(snack.errors[:memo]).to include("を入力してください")
  end
end
