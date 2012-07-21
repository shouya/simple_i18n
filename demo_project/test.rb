# -*- coding: utf-8 -*-

require './lib/libfoo'

# default language is English as previously set
puts foo #=> 'Display Username'

switch_to_zh
puts foo #=> '顯示用戶名'


switch_to_en
puts foo #=> 'Display Username'


puts current_language #=> 'en'
puts current_language(:full_name => true) #=> 'English'

