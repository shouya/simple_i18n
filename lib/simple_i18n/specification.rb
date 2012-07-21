
require './langauge'

module SimpleI18n
  module Specification

    def set_default_language(lang_abbr)
      unless Language.table.key?(lang_abbr)
        warn 'No language [%s] defined.' % lang_abbr
        return
      end

      Language.default = Language.table[lang_abbr]
    end

    def load_language_file(filename, options = {})
      BasicObject.new.instance_eval do
        include TranslationDefinition
        load filename
      end
    end


    module TranslationDefinition

      def define_language(abbreviation, full_name, &block)
        lang = Language.new(abbreviation, full_name)

        if block.arity == 0
          lang.instance_eval(&block)
        elsif block.arity == 1
          block.call(lang)
        else
          warn 'Pass one or zero argument to `define_language\' please.'
        end
      end

    end


  end
end
