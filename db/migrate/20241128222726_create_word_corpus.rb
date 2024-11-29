class CreateWordCorpus < ActiveRecord::Migration[7.0]
  def change
    create_table :word_corpus, primary_key: :corpus_id do |t|
      t.string :description
      t.string :image_src
      t.string :location
      t.json :segment
      t.string :transliteration
      t.integer :word_id

      t.timestamps
    end

    add_index :word_corpus, :word_id
  end
end
