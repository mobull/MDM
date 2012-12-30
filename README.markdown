# Mobull MDM

The project is currently under development.

For issues / enhancement requests, please raise them [here](https://github.com/mobull/MDM/issues).

## Get Started

Please checkout [Mobull Wiki](https://github.com/mobull/playbook/).

## Dependencies

### PhantomJS

(For [Guard Jasmine](https://raw.github.com/guard/guard-jasmine/))

You need the PhantomJS browser installed on your system. You can download binaries for Mac OS X and Windows from
[the PhantomJS download section](http://code.google.com/p/phantomjs/downloads/list).

Alternatively you can install [Homebrew](http://mxcl.github.com/homebrew/) on Mac OS X and install it with:

```bash
$ brew install phantomjs
```

If you are using Ubuntu 12.04 or above, phantomjs is in the official repositories and can be installed with apt:

```bash
$ sudo apt-get install phantomjs
```

For older versions of Ubuntu, you will need to add a repository first:

```bash
$ sudo add-apt-repository ppa:jerome-etienne/neoip
$ sudo apt-get update
$ sudo apt-get install phantomjs
```

You can also build it from source for several other operating systems, please consult the
[PhantomJS build instructions](http://code.google.com/p/phantomjs/wiki/BuildInstructions).

## Gems Used in This Project

### Slim

* http://rdoc.info/github/stonean/slim

### Strong Parameters

* http://rdoc.info/gems/strong_parameters/frames/

### RSpec

* http://betterspecs.org/
* http://apidock.com/rspec/
* https://www.relishapp.com/rspec/rspec-core/v/2-12/docs/

### FactoryGirl

* https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

### Faker

* http://rdoc.info/gems/faker/frames

### Backbone Rails

* https://github.com/codebrew/backbone-rails
* http://ricostacruz.com/backbone-patterns/
* http://adamjspooner.github.com/coffeescript-meet-backbonejs/

### Jasmine

* http://pivotal.github.com/jasmine/
* https://github.com/pivotal/jasmine-gem
* https://github.com/guard/guard-jasmine

### Jbuilder

* https://github.com/rails/jbuilder
