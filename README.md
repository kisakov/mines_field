# MinesField

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mines_field`. To experiment with that code, run `bin/console` for an interactive prompt.

There is a field of mines. Each mine is identified by a 2d-coordinate and a blast radius. When a mine explodes at time interval t, it explodes mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and blast radius (ex 2, 2, 5), write a program that finds which mine(s) in the list trigger the greatest number of explosions. Use the Euclidean distance to determine whether a mine lays within the radius of another mine. Your program should produce an output file showing the mines, identified by their coordinates & blast radius, in descending order of total generated explosions.

A sample mines files is attached.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mines_field'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mines_field

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mines_field.

