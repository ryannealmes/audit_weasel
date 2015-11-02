[![Code Climate](https://codeclimate.com/repos/56366d6b1787d72fa4002b02/badges/4d5a1c11ffebbf2fcdd8/gpa.svg)](https://codeclimate.com/repos/56366d6b1787d72fa4002b02/feed)
[![Test Coverage](https://codeclimate.com/repos/56366d6b1787d72fa4002b02/badges/4d5a1c11ffebbf2fcdd8/coverage.svg)](https://codeclimate.com/repos/56366d6b1787d72fa4002b02/coverage)

# AuditWeasel

AuditWeasel is meant to provide a light weight rails auditing tool. It
provides way of auditing changes to database records. It works on two fields
created_by_user_id and updated_by_user_id to keep track of changes made to a
record. This of a timestamp for user changes.

So let's say user A updates a record, the record will record user A in the
created_by_user_id and updated_by_user_id fields. Now user B comes along and
makes a change to the field, the updated_by_user_Id will change to user B.

This is pretty handy if you don't want to burden your system with heavy
auditing, but you do want to be able to have insight into what your users
have done.

## Installation

Add this line to your application's Gemfile:

    gem 'audit_weasel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install audit_weasel



## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/audit_weasel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
