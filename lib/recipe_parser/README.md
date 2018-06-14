# Recipe Parser

Since our templates inherit from each other we need to understand the
content of each of the templates. My long term vision is to create a
user friendly version in which all the templates are properly merged
together. Then you can just read one of the recipes. It will be
automatically added in the proper template.

At the same time I still want markdown to be used for all the recipes.
That makes it very comfortable to write recipes. At the same time it is
also a little easier for everyone to follow the recipes directly in this
git repository.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recipe_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recipe_parser

## Usage

Currently only tests have been added.

```
bundle exec rspec
```

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
