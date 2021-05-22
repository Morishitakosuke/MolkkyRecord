require "rails_helper"

describe Tag do
  describe "アソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Postモデルとの関係" do
      let(:target) { :post }

      it "1:多" do
        expect(association.macro).to eq :has_many
      end

      it "結合するモデルのクラス名：Post" do
        expect(association.class_name).to eq "Post"
      end
    end

    context "TagPostモデルとの関係" do
      let(:target) { :tag_post }

      it "1:多" do
        expect(association.macro).to eq :has_many
      end

      it "結合するモデルのクラス名：TagPosts" do
        expect(association.class_name).to eq "TagPost"
      end
    end
  end
end
