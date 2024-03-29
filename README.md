# ModelDecorator
The gem allows you to easily define methods to decorate your classes.
Decorator Classes will have to inherit from `SimpleDelegator`.

## Installation
Install the gem and add to the application's Gemfile by executing:

```
$ bundle add model_decorator
```
If bundler is not being used to manage dependencies, install the gem by executing:

```
$ gem install model_decorator
```
## Usage
### 1) Define a Decorator class
```Ruby
class EmailDecorator < SimpleDelegator # Decorators MUST inherit from SimpleDelegator
    def send_email
        # Add logic here
    end
end
```
### 2) Include ModelDecorator module
```Ruby
class User
    include ModelDecorator

    decorate_with EmailDecorator, as: :mailer
end
```
### 3) Call the decorator class methods
```Ruby
user = User.new
user.mailer.send_email # Same as EmailDecorator.new(user).send_email
```
## Development
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [﻿rubygems.org](https://rubygems.org/).

## Contributing
Bug reports and pull requests are welcome on GitHub at [﻿https://github.com/LapoElisacci/model_decorator](https://github.com/LapoElisacci/model_decorator). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [﻿code of conduct](https://github.com/LapoElisacci/model_decorator/blob/main/CODE_OF_CONDUCT.md).

## License
The gem is available as open source under the terms of the [﻿MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the ModelDecorator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [﻿code of conduct](https://github.com/LapoElisacci/model_decorator/blob/main/CODE_OF_CONDUCT.md).
