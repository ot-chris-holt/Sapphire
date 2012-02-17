module Sapphire
  module DSL
    module Data
      def Validate(hash)
        EqualsModifier.new(Validate.new(hash))
      end

      class Validate < Verb
       def execute
          return { :value => @item.Validate(@item) }
        end
      end
    end
  end
end

