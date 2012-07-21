
require_relative '../i18nspec'

def switch_to_zh
  switch_language('zh')
end

def switch_to_en
  switch_language('en')
end

def foo
  tr['display-username']
end
