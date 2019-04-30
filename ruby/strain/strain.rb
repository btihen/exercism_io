class Array

    def keep &block
      each_with_object([]) { |elem, arr| arr << elem if block.call(elem) }
    end

    def discard
      each_with_object([]) { |elem, arr| arr << elem unless yield(elem) }
    end

end
