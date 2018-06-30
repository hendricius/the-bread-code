require "recipe_parser"

module RecipeParser
  class SectionsExtractor
    def initialize(markdown)
      @markdown = markdown
    end

    def sections
      @sections ||= parse_sections
    end

    private

    def parse_sections
      return [] if @markdown&.empty?
      matches = @markdown.scan(regex)
      return [] if matches.nil?
      convert_matches(matches)
    end

    def convert_matches(matches)
      matches.each_with_index.map do |group, index|
        group = group.map {|g| g.strip }
        Section.new(
          name: group[1],
          content: group[2],
          type: extract_type(name: group[1],
                             position: index + 1,
                             total_sections: matches.length)
        )
      end
    end

    def extract_type(name:, position:, total_sections:)
      return Section::TITLE if position == 1
      return Section::INGREDIENTS if name == "Ingredients"
      Section::DEFAULT
    end

    def regex
      /^(\#{1,})\s(.*$)([\s\S]*?)(?=#|\Z)/
    end
  end
end
