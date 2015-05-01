class Word

  @@word_info = []

  attr_reader(:word, :language, :origin)

  define_method(:initialize) do |word, language, origin|
    @word = word
    @language = language
    @origin = origin
    @id = @@word_info.length + 1
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@word_info
  end

  define_method(:save) do
    @@word_info.push(self)
  end

  define_singleton_method(:clear) do
    @@word_info = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@word_info.each do |word|
      if word.id == id.to_i
        found_word = word
      end
    end
    found_word
  end
end
