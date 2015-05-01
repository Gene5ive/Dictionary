require 'rspec'
require 'definition'
require 'pry'

describe (Definition) do
  before() do
    Definition.clear()
  end

  describe('#initialize', '#attr_reader') do
    it('returns a definition') do
      test_definition = Definition.new("mini")
      expect(test_definition.definition).to(eq("mini"))
    end
  end

  describe('#id') do
    it("returns the id of the definition") do
      test_definition = Definition.new("mini")
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("adds definition object to the definition class array") do
      test_definition = Definition.new("mini")
      test_definition.save
    end
  end

  describe('.clear') do
    it("clear the definitions from memory") do
      Definition.new("mini")
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("returns a definition object by its ide number") do
      test_definition = Definition.new("mini")
      test_definition.save
      test_definition2 = Definition.new("huge")
      test_definition2.save
      expect(Definition.find(test_definition2.id)).to(eq(test_definition2))
    end
  end
end
