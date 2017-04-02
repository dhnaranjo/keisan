module Keisan
  module AST
    class UnaryMinus < UnaryOperator
      def value(context = nil)
        return -1 * child.value(context)
      end

      def evaluate(context = nil)
        -child.evaluate(context)
      end

      def self.symbol
        :"-"
      end

      def simplify(context = nil)
        context ||= Context.new

        case child
        when AST::Number
          AST::Number.new(-child.value(context)).simplify(context)
        else
          super
        end
      end
    end
  end
end
