class Word < ActiveRecord::Base
  before_save { self.word = word.downcase }
  validates :word, presence: true, length: { maximum: 50 },
                   uniqueness: { case_sensitive: false }
end
