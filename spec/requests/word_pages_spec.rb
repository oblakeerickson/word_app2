require 'spec_helper'

describe "Word pages" do

  subject { page }

  describe "word page" do
    let(:word) { FactoryGirl.create(:word) }
    before { visit word_path(word) }

    it { should have_content(word.word) }
  end

  describe "new" do

    before { visit new_word_path }

    let(:submit) { "Add word" }

    describe "with invalid information" do
      it "should not create a word" do
        expect { click_button submit }.not_to change(Word, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Word",  with: "pickle"
      end

      it "should create a word" do
        expect { click_button submit }.to change(Word, :count).by(1)
      end
    end
  end
end
