# == Schema Information
#
# Table name: word_corpus
#
#  description     :string
#  image_src       :string
#  location        :string
#  segment         :json
#  transliteration :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  corpus_id       :bigint           not null, primary key
#  word_id         :integer
#
# Indexes
#
#  index_word_corpus_on_word_id  (word_id)
#

class WordCorpus < ApplicationRecord
  self.table_name = 'word_corpus'
  
  belongs_to :word

  validates :word_id, presence: true
end
