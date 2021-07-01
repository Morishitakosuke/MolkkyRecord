require "rails_helper"

describe Post do
  before do
    @post = FactoryBot.create(:post)
    @post.image = fixture_file_upload("app/assets/images/test.jpg")
  end

  describe "投稿の保存" do
    context "投稿が保存できる場合" do
      it "つぶやきが入力されていれば投稿できる" do
        expect(@post).to be_valid
      end

      it "画像を選択していなくても投稿できる" do
        @post.image = ""
        expect(@post).to be_valid
      end
    end

    context "投稿が保存できない場合" do
      it "つぶやきが空だと投稿は保存できない" do
        @post.content = ""
        @post.valid?
      end

      it "つぶやきが200文字以上だと投稿は保存できない" do
        @post.content = "a" * 201
        @post.valid?
      end

      it "ユーザーが紐付いていないと投稿は保存できない" do
        @post.user = nil
        @post.valid?
      end
    end
  end
end
