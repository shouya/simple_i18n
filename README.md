# Simple I18n

Using this gem is very easy to add multilanguage support for small projects.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_i18n'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_i18n

## Usage

First you'd create a language specification file. This file is recommended to
named as `i18nspec.rb` and put in the root directory of project.

Which shall contain the content like:

	require 'simple_i18n'
	
	SimpleI18n.load_language_file('language/lang-en')
	SimpleI18n.load_language_file('language/lang-zh')
	# ... other languages
	SimpleI18n.set_default_language('en')


Where you'd create a directory names `language` too. And inside there shall be
the language translation files, right name as form of `lang-en` as above.

The language files should contain the translation tables. Fortunately they are
defined in ruby also, in the form of:

	# in file `lang-en`
	
	define_language('en', 'English') do |en|
	  en['display-username'] = 'Display Username'
	  en['reset-password'] = 'Reset Password'
	  # ... others translations
	end

Different translation tables should define same tokens, for example:

	# in file `lang-zh`
	
	# -*- encoding: utf-8 -*-
	
	define_language('zh', '中文') do |zh|
	  zh['display-username'] = '顯示用戶名'
	  zh['reset-password'] = '重置密碼'
	  # ... blah blah blah
	end

Note the encoding specification might be required for non-ascii files.

Then you can use these in your code:

	# a file in project
	require '../i18nspec'
	
	def turn_to_english
	  swith_language('en')
	end
	def turn_to_chinese
	  switch_language('zh')
	end
	
	def foo
		tr['display-username'] #=> 'Display Username' or '顯示用戶名'
	end

Via refering translations with `tr` and changing current language with
`switch_language` methods whereever you need.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
