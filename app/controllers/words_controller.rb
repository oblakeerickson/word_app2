class WordsController < ApplicationController

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      #
    else
      render 'new'
    end
  end

  private

  def word_params
    params.require(:word).permit(:word)
  end
end
