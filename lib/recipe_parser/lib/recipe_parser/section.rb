require "recipe_parser"

module RecipeParser
  class Section
    DEFAULT     = :section.freeze
    INGREDIENTS = :ingredients.freeze
    TITLE       = :title.freeze

    attr_reader :name, :content, :type

    def initialize(name:, content:, type: :section)
      @name    = name
      @content = content
      @type    = type
    end
  end
end
