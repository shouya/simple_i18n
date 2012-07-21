
$LOAD_PATH << '.'

require 'simple_i18n/version'
require 'simple_i18n/language'
require 'simple_i18n/specification'

module SimpleI18n
  class << self
    include Specification
  end
  
  
  Kernel.class_eval do
    def tr
      return Language.current
    end
    
    def switch_language(lang)
      unless Language.table.has_key?(lang)
        warn 'Language %s is not defined.' % lang
        return Language.current
      end
      Language.current = Language.table[lang]
    end

    def current_language(option={})
      return option[:full_name] ?
        Language.current.full_name :
        Language.current.abbreviation
    end
  end
  
end

