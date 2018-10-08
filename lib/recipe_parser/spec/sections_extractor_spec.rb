RSpec.describe RecipeParser::SectionsExtractor do

  describe "basic" do
    it "can be instantiated" do
      expect(described_class.new("").class).to eq(described_class)
    end
  end

  describe ".sections" do
    let(:sample_recipe) { File.read("#{Dir.pwd}/spec/fixtures/standard_recipe.md")}
    let(:sample_sourdough_recipe) { File.read("#{Dir.pwd}/spec/fixtures/sourdough_standard_recipe.md")}
    let(:service) { described_class.new(sample_recipe) }
    let(:sourdough_service) { described_class.new(sample_sourdough_recipe) }

    it "returns the correct amount of sections" do
      expect(service.sections.length).to eq(16)
    end

    it "has the title properly extracted" do
      sect = service.sections.first
      expect(sect.name).to eq('The Basic Dough')
      expect(sect.type).to eq(:title)
    end

    it "has the ingredients properly extracted" do
      sect = service.sections[1]
      expect(sect.name).to eq('Ingredients')
      expect(sect.type).to eq(:ingredients)
    end

    it "has the correct last section" do
      sect = service.sections.last
      expect(sect.name).to eq('Remove (the tray with water or lid)')
      expect(sect.type).to eq(:section)
    end

    it "has all the headlines in order" do
      expected = [
        "The Basic Dough",
        "Ingredients",
        "Instructions",
        "Preparation steps",
        "Autolyse",
        "Add the yeast",
        "Form the gluten",
        "Stretch and Fold Part 1",
        "Stretch and Fold Part 2",
        "Shaping the dough",
        "Recipe customization",
        "Finalizing the shaping",
        "Place the dough in a clean bowl",
        "Preheat the oven to maximum temperature",
        "Finally bake the bread",
        "Remove (the tray with water or lid)",
      ]
      sections = service.sections
      expected.each_with_index do |exp, index|
        expect(sections[index]).to_not be_nil
        expect(sections[index].name).to eq(exp)
      end
    end

    it "extracts sections for the sourdough template too" do
      expected = [
        "The Basic Sourdough",
        "Ingredients",
        "Instructions",
        "Preparation steps",
        "Autolyse",
        "Add the starter dough",
        "Give back to the mother dough",
        "Knead the dough",
        "Let the gluten form",
        "Shape the dough",
        "Recipe customization",
        "Finalizing the shaping",
        "Place the dough in a clean bowl",
        "Preheat the oven to maximum temperature",
        "Finally bake the bread",
        "Remove (the tray with water or lid)"
      ]
      sections = sourdough_service.sections
      expected.each_with_index do |exp, index|
        expect(sections[index]).to_not be_nil
        expect(sections[index].name).to eq(exp)
      end
    end
  end
end
