require 'rspec'
require 'dictionary'
require 'pry'

describe (Definition) do

  describe('#initialize', '#attr_reader') do
    it('returns the list of definitions for the word') do
      test_definition = Definition.new("short", "not-long", "little")
      expect(test_definition.first).to(eq("short"))
      expect(test_definition.second).to(eq("not-long"))
      expect(test_definition.third).to(eq("little"))
    end
  end
end
