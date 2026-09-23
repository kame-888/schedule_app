require "rails_helper"

RSpec.describe Post, type: :model do
  describe "バリデーション" do
    context "全項目が揃っている場合" do
      it "valid になる" do
        post = build(:post)
        expect(post).to be_valid
      end
    end

    context "title が空の場合" do
      it "invalid になり、エラーメッセージが返る" do
        post = build(:post, title: "")
        expect(post).not_to be_valid
        expect(post.errors[:title]).to include("can't be blank")
      end
    end

    context "start_date が空の場合" do
      it "invalid になり、エラーメッセージが返る" do
        post = build(:post, start_date: "")
        expect(post).not_to be_valid
        expect(post.errors[:start_date]).to include("can't be blank")
      end
    end

    context "end_date が空の場合" do
      it "invalid になり、エラーメッセージが返る" do
        post = build(:post, end_date: "")
        expect(post).not_to be_valid
        expect(post.errors[:end_date]).to include("can't be blank")
      end
    end

    context "end_date が start_date より前の日付の場合" do
      it "invalid になる" do
        post = build(:post, end_date: Date.yesterday, start_date: Date.current)
        expect(post).not_to be_valid
      end
    end
  end
end
