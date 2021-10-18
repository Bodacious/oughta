# Oughta

Automatically generate missing unit tests for Rails models.

Did you _forget_ to write test for your Rails models? Oughta can help, by automatically
generating a lot of the test files and assertions for you.

Using the collection of matchers from [Thoughtbot's Shoulda](https://github.com/thoughtbot/shoulda "Shoulda by Thoughtbot"), oughta will parse your model code and oughta-matically generate assertions for your existing code.

## Example

Suppose you have a model like this:

``` ruby
class User < ApplicationRecord
  # ==============================================================================
  # = Associations =
  # ==============================================================================
  has_many :comments, dependent: :delete_all

  belongs_to :company, required: true

  # ==============================================================================
  # = Validations =
  # ==============================================================================
  validates :name, presence: { on: :update }

  validates :username, uniqueness: { scope: 'company_id' }, presence: true

  validates :age, numericality: { allow_nil: true, greater_than: 17 }

  validates :email, length: { in: 15..50 }
end
```

Oughta will automatically generate a spec file that looks like this:

``` ruby
require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:company).with_message(:required) }

    it { should validate_presence_of(:name).on(:update) }

    it { should validate_uniqueness_of(:username).scoped_to(:company_id) }

    it { should validate_presence_of(:username) }

    it { should validate_numericality_of(:age).allow_nil.is_greater_than(17) }

    it { should validate_length_of(:email).is_at_least(15).is_at_most(50) }
  end
  describe "associations" do
    it { should have_many(:comments).dependent(:delete_all) }

    it { should belong_to(:company).required }
  end
end
```


## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'oughta'
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install oughta

## Usage

To generate specs for a model, use the following command:

```
rails g oughta:model_spec [YourModel]
```

## Feature requests

To request a new feature or a change to an existing feature, please start a discussion here: https://github.com/Bodacious/oughta/discussions/

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bodacious/oughta.

Let's make the world a better place, by reducing the amount of untested code.

## Support

If Oughta has saved you some time or made your life easier, please consider supporting future development with a small contribution to [Buy Me a Coffee](https://www.buymeacoffee.com/gavinmorrice) :coffee:.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
