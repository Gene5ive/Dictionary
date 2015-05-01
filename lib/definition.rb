class Definition

  @@definitions = []

  attr_reader(:definition, :id)

  define_method(:initialize) do |definition|
    @definition = definition
    @id = @@definitions.length + 1
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |id|
    found_def = nil
    @@definitions.each do |definition|
      if definition.id == id.to_i
        found_def = definition
      end
    end
    found_def
  end
end
