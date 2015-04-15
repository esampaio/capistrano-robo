# Capistrano::Robo

This gem will let you run [Robo](http://robo.li/) tasks with Capistrano 3.x.

## Installation

Add this line to your application's Gemfile:

```bash
gem 'capistrano', '~> 3.1'
gem 'capistrano-robo'
```

And then execute:

```
$ bundle install
```

2. Add to `Capfile` or `config/deploy.rb`:

```ruby
require 'capistrano/robo'
```

## Usage

To run tasks:

```ruby
after :updated, :test do
  invoke :robo, 'test'
end
```

You can pass additional parameters if needed:

```ruby
after :updated, :migrate do
  invoke :robo, 'migrations:migrate', 'production'
end
```

The above would be equivalent of running the following from the command line:

```bash
robo -v migrations:migrate production
```

## Configuration

To specify where the Robo executable is, use the `:robo_exec` option:

```ruby
set :robo_exec, 'bin/robo'
```

Configurable options:

```ruby
set :robo_exec, 'robo'                                    # default
set :robo_flags, '-v'                                     # default
set :robo_roles, :all                                     # default
set :robo_target_path, -> { release_path }                # default
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
