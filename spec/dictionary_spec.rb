require 'rspec'
require 'dictionary'
require 'pry'

describe (Definition) do

  describe('#initialize', '#attr_reader') do
    it('returns a list of definitions') do
      test_definition = Definition.new("mini", "not-big", "little")
      expect(test_definition.first).to(eq("mini"))
      expect(test_definition.second).to(eq("not-big"))
      expect(test_definition.third).to(eq("little"))
    end
  end

  describe('#id') do
    it('returns the id of the definition list') do
      test_definition = Definition.new("mini,", "not-big", "little")
      expect(test_definition.id()).to(eq(1))
    end
  end
end
