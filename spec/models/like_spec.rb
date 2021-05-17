require "rails_helper"

describe Like do
  describe "アソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Postモデルとの関係" do
      let(:target) { :post }
      it "多:1" do
        expect(association.macro).to eq :belongs_to
      end
      it "結合するモデルのクラス名：Post" do
        expect(association.class_name).to eq "Post"
      end
    end

    context "Userモデルとの関係" do
      let(:target) { :user }
      it "多:1" do
        expect(association.macro).to eq :belongs_to
      end
      it "結合するモデルのクラス名：User" do
        expect(association.class_name).to eq "User"
      end
    end
  end
end