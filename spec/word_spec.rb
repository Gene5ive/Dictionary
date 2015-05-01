require 'rspec'
require 'word'
require 'pry'

describe (Word) do
  before() do
    Word.clear()
  end

  describe('#initialize', '#attr_reader') do
    it('returns a detail about a word') do
      test_word = Word.new("small", "English", "Europe")
      expect(test_word.word).to(eq("small"))
      expect(test_word.language).to(eq("English"))
      expect(test_word.origin).to(eq("Europe"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new("small,", "English", "Europe")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("adds word object to the word class array") do
      test_word = Word.new("small", "English", "Europe")
      test_word.save
    end
  end

  describe('.clear') do
    it("clear the words from memory") do
      Word.new("small", "English", "Europe")
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("returns a word object by its id number") do
      test_word = Word.new("small", "English", "Europe")
      test_word.save
      test_word2 = Word.new("big", "English", "Europe")
      test_word2.save
      expect(Word.find(test_word2.id)).to(eq(test_word2))
    end
  end
end
