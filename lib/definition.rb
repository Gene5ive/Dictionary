class Definition

  @@definition_info = []

  attr_reader(:first, :second, :third)

  define_method(:initialize) do |first, second, third|
    @first = first
    @second = second
    @third = third
    @id = @@definition_info.length + 1
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@definition_info
  end

  define_method(:save) do
    @@definition_info.push(self)
  end

  define_singleton_method(:clear) do
    @@definition_info = []
  end

  define_singleton_method(:find) do |id|
    found_def = nil
    @@definition_info.each do |definition|
      if definition.id == id.to_i
        found_def = definition
      end
    end
    found_def
  end
end
