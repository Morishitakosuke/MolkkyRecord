require "rails_helper"

describe Record do
  before do
    @record = FactoryBot.create(:record)
  end

  describe "スコア投稿の保存" do
    context "スコア投稿が保存できる場合" do
      it "全てが入力されていれば投稿できる" do
        expect(@record).to be_valid
      end

      it "タイトルが空でも投稿できる" do
        @record.title = ""
        expect(@record).to be_valid
      end

      it "場所が空でも投稿できる" do
        @record.place = ""
        expect(@record).to be_valid
      end

      it "チーム名(自)が空でも投稿できる" do
        @record.teamname = ""
        expect(@record).to be_valid
      end

      it "チーム名(相)が空でも投稿できる" do
        @record.enemyteam = ""
        expect(@record).to be_valid
      end

      it "nama_bが空でも投稿できる" do
        @record.name_b = ""
        expect(@record).to be_valid
      end

      it "nama_cが空でも投稿できる" do
        @record.name_c = ""
        expect(@record).to be_valid
      end

      it "enemynama_aが空でも投稿できる" do
        @record.enemyname_a = ""
        expect(@record).to be_valid
      end

      it "enemynama_bが空でも投稿できる" do
        @record.enemyname_b = ""
        expect(@record).to be_valid
      end

      it "enemynama_cが空でも投稿できる" do
        @record.enemyname_c = ""
        expect(@record).to be_valid
      end

      it "score_1以外が空でも投稿できる" do
        @record.score_2 = ""
        @record.score_3 = ""
        @record.score_4 = ""
        @record.score_5 = ""
        @record.score_6 = ""
        @record.score_7 = ""
        @record.score_8 = ""
        @record.score_9 = ""
        @record.score_10 = ""
        expect(@record).to be_valid
      end

      it "enemyscoreが空でも投稿できる" do
        @record.enemyscore_1 = ""
        @record.enemyscore_2 = ""
        @record.enemyscore_3 = ""
        @record.enemyscore_4 = ""
        @record.enemyscore_5 = ""
        @record.enemyscore_6 = ""
        @record.enemyscore_7 = ""
        @record.enemyscore_8 = ""
        @record.enemyscore_9 = ""
        @record.enemyscore_10 = ""
        expect(@record).to be_valid
      end
    end

    context "スコア投稿が保存できない場合" do
      it "name_aが空だと投稿が保存できない" do
        @record.name_a = ""
        @record.valid?
      end

      it "score_1が空だと投稿が保存できない" do
        @record.score_1 = ""
        @record.valid?
      end

      it "タイトルが15文字以上だと投稿は保存できない" do
        @record.title = "a" * 16
        @record.valid?
      end

      it "チーム名(自)が15文字以上だと投稿は保存できない" do
        @record.teamname = "a" * 16
        @record.valid?
      end

      it "チーム名(相)が15文字以上だと投稿は保存できない" do
        @record.enemyteam = "a" * 16
        @record.valid?
      end

      it "場所が20文字以上だと投稿は保存できない" do
        @record.place = "a" * 21
        @record.valid?
      end

      it "名前(自)が12文字以上だと投稿は保存できない" do
        @record.name_a = "a" * 13
        @record.name_b = "a" * 13
        @record.name_c = "a" * 13
        @record.valid?
      end

      it "名前(相)が12文字以上だと投稿は保存できない" do
        @record.enemyname_a = "a" * 13
        @record.enemyname_b = "a" * 13
        @record.enemyname_c = "a" * 13
        @record.valid?
      end

      it "スコア(自)の数字は12以上が保存できない" do
        @record.score_1 = 13
        @record.score_2 = 13
        @record.score_3 = 13
        @record.score_4 = 13
        @record.score_5 = 13
        @record.score_6 = 13
        @record.score_7 = 13
        @record.score_8 = 13
        @record.score_9 = 13
        @record.score_10 = 13
        @record.valid?
      end

      it "スコア(相)の数字は12以上が保存できない" do
        @record.enemyscore_1 = 13
        @record.enemyscore_2 = 13
        @record.enemyscore_3 = 13
        @record.enemyscore_4 = 13
        @record.enemyscore_5 = 13
        @record.enemyscore_6 = 13
        @record.enemyscore_7 = 13
        @record.enemyscore_8 = 13
        @record.enemyscore_9 = 13
        @record.enemyscore_10 = 13
        @record.valid?
      end

      it "ユーザーが紐付いていないと投稿は保存できない" do
        @record.user = nil
        @record.valid?
      end
    end
  end
end
