
module SimpleI18n
  class Language

    class << self
      attr_accessor :default, :current
      attr_accessor :table
    end

    attr_reader :abbreviation, :full_name
    attr :translations

    def initialize(abbr, full_name)
      @translations = {}
      @abbreviation = abbr
      @full_name = full_name

      self.class.table ||= {}
      self.class.default ||= self
      self.class.current ||= self

      if self.class.table.has_key?(abbr)
        warn 'Redefining %s language.' % abbr
      end

      self.class.table[abbr] = self
    end

    def token_defined?(token_name)
      return @translations.has_key?(token_name)
    end

    def [](token)
      tran = @translations[token]
      return tran if tran

      default_lang = self.class.default

      if default_lang == self or (not default_lang.token_defined? token)
        warn 'No token [%s] defined.' % token
        return token
      end

      warn 'No token [%s] defined in %s, take from %s.' % \
           [token, @abbreviation, default_lang.abbreviation]
      return default_lang[token]
    end

    def []=(token, translation)
      if translations.has_key?(token)
        warn 'Token [%s] redefined in language %s.' % [token, @abbreviation]
      end
      @translations[token] = translation
    end
    
  end

end

