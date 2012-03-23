module Sapphire
  module DSL
    module Browser
      def Exists(symbol)
        if($page.Contains symbol)
          begin
            return $page.Get(symbol.Visible(false))
          rescue
            return false
          end
        end
      end
    end
  end
end

