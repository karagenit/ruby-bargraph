module Graph
  class Bar
    def initialize(data = nil)
      @data = data
    end

    def data(data = nil)
      @data = data unless data.nil?
      @data
    end

    def print
      @data.each_with_index do |count, index|
        printf "%02d|%s\n", index, ('#' * count)
      end
    end
  end
end
