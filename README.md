# ConsoleColor

ConsoleColor adds the color-coded application name and environment to your Rails console prompt.

![](http://f.cl.ly/items/3U2M3c1c230s0S2X3n22/Screen%20Shot%202013-11-22%20at%2012.06.43%20AM.png)

![](http://f.cl.ly/items/3j1o3w3N1E382a211d1P/Screen%20Shot%202013-11-21%20at%2011.48.18%20PM.png)

![](http://f.cl.ly/items/0e3v3N0k0P1y471t2c3k/Screen%20Shot%202013-11-22%20at%2012.04.41%20AM.png)

By default, the prompt is green in development, red in production, and yellow elsewhere. Alternatively, you can specify a custom color in an initializer (using the [bash colorization codes](http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html)):

    ConsoleColor::COLORS['production'] = "\e[35m"  # pink

Note that one can set the `CONSOLE_COLOR_ENV` var to override the Rails
environment:

```
$ CONSOLE_COLOR_ENV=staging RAILS_ENV=production rails console
app_name:staging>Rails.env
=> "production"
```

This way you can set your staging Rails env to production to mimic that
configuration but have your prompt reflect that you're using on the staging
server.

## Installation

Add this line to your application's Gemfile:

    gem 'console_color'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install console_color


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


&copy; Joey Aghion

[LICENSE](LICENSE.txt)
