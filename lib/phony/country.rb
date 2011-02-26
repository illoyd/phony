module Phony
  
  #
  #
  class Country
    
    attr_accessor :codes
    
    # 
    #
    def initialize *codes
      @codes = codes
    end
    
    # DSL.
    #
    # TODO
    #
    def |(other)
      self.codes = self.codes + other.codes
      self
    end
    
    # A number is split with the code handlers as given in the initializer.
    #
    def split national_number
      @codes.each do |code|
        ndc, *rest = code.split national_number
        return [ndc, *rest] if rest && !rest.empty?
      end
    end
    
    # Removes 0s from partially normalized numbers
    # such as 410443643533.
    # 
    # Example:
    #   410443643533 -> 41443643533
    #
    # In some cases it doesn't, like Italy.
    #
    def normalize national_number
      @codes.each do |code|
        normalized = code.normalize national_number
        return normalized if normalized && !normalized.empty?
      end
    end
    
    # Is this national number a vanity number?
    #
    def vanity? national_number
      Vanity.vanity? national_number
    end
    #
    #
    def vanity_to_number vanity_number
      ndc, *rest = split vanity_number
      "#{ndc}#{Vanity.replace(rest.join)}"
    end
    
  end
  
end