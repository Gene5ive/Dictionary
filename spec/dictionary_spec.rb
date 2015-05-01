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
    it("returns the id of the definition list") do
      test_definition = Definition.new("mini,", "not-big", "little")
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds definition object to the definition class array") do
      test_definition = Definition.new("mini", "not_big", "little")
      test_definition.save()
    end
  end

  # describe('.clear') do
  #   it("clear the definitions from memory") do
  #     Definition.new("mini", "not_big", "little")
  #     Definition.clear()
  #     expect(Definition.all()).to(eq([]))
end
