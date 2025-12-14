require "rails_helper"

RSpec.describe "Snacks", type: :system do
  it "ログイン後におつまみを投稿して一覧に表示される" do
    user = FactoryBot.create(:user, password: "password")

    login_as(user)

    visit new_snack_path

    fill_in "おつまみ名", with: "枝豆"
    fill_in "合うお酒", with: "ビール"
    fill_in "食べ物カテゴリ", with: "スナック系"
    fill_in "メモ", with: "おつまみの定番です！"
    click_button "投稿する"

    expect(page).to have_content("枝豆")
  end
end
