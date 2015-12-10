[![Gem Version](https://badge.fury.io/rb/audit_weasel.svg)](https://badge.fury.io/rb/audit_weasel)
[![Code Climate](https://codeclimate.com/github/ryannealmes/audit_weasel/badges/gpa.svg)](https://codeclimate.com/github/ryannealmes/audit_weasel)
[![Build Status](https://travis-ci.org/ryannealmes/audit_weasel.svg?branch=master)](https://travis-ci.org/ryannealmes/audit_weasel.svg)
[![Test Coverage](https://codeclimate.com/github/ryannealmes/audit_weasel/badges/coverage.svg)](https://codeclimate.com/github/ryannealmes/audit_weasel/coverage)
[![Dependency Status](https://gemnasium.com/ryannealmes/audit_weasel.svg)](https://gemnasium.com/ryannealmes/audit_weasel)

# AuditWeasel

AuditWeasel is a light weight Rails auditing tool. It track changes
to database records using two fields on a table - created_by_user_id and
updated_by_user_id. It's sort of like a timestamp field, but for users.

So let's say user A updates a record, the record will have user A in the
created_by_user_id and updated_by_user_id fields. Now user B comes along and
makes a change to the record, the updated_by_user_Id will change to user B.

This is pretty handy if you don't want to burden your system with heavy
auditing, but you do want to have insight into what your users
have done. It's all in the background and if you want to expose the 
auditing data through the front end your can since it's just a normal 
field on the model.

## Installation

Add this line to your application's Gemfile:

    gem 'audit_weasel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install audit_weasel

## Usage

To install audit_weasel:

```
rails generate audit_weasel:install
```

This will generate a config file under the initializers directory. Right now
there no configuration settings, but I am looking to add a couple of things.

To audit a table:

```
rails generate audit_weasel [table_name]
```

This will generate migration scripts that will add created_by_user_id and
updated_by_user_id to the table. Run the migrations and you should be
good. Start making changes through your application and your should see 
user ids recorded against the record being changed!

AuditWeasel depends on current_user being available at the application
controller level as that is where the active user is set. If you are using
devise things should just work. If you aren't using devise you can always
extend your application to expose a current user.

```ruby
class ApplicationController < ActionController::Base
  def current_user
    # get the current user
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/audit_weasel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Ensure your stuff is rubocop'd

I am always keen to learn so please feel free to create an issue with code
reviews, suggestions and possible refactorings.

## TODOS

- Currently if the application controller does not have a `current_user`
accessible AuditWeasel will not do anything. Extend to code to allow
developers to configure the name of the method used to retrieve the current
user on the application controller.
- It would be nice to extend this to work with APIs. I am sure the concept
is pretty much the same, I just need to look at it. Feel free to make a PR.
