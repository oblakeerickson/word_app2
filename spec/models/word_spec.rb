require 'spec_helper'

describe Word do

  before { @word = Word.new(word: "pickle") }

  subject { @word }

  it { should respond_to(:word) }

  it { should be_valid }

  describe "when word is not present" do
    before { @word.word = " " }
    it { should_not be_valid }
  end

  describe "when word is too long" do
    before { @word.word = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when word is already stored" do
    before do
      word_with_same_word = @word.dup
      word_with_same_word.word = @word.word.upcase
      word_with_same_word.save
    end

    it { should_not be_valid }
  end
end