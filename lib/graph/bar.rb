##
# This module contains tools for analyzing and graphing data arrays
#
module Graph
  ##
  # Modes for printing the graph
  #
  module PrintMode
    NOSCALE = 1
    AUTOSCALE = 2
    SCALE = 3
  end
  ##
  # This class allows the display of data arrays in bar graph format
  #
  class Bar
    include PrintMode
    ##
    # Allows optionally setting the initial dataset as a parameter
    #
    def initialize(data = nil)
      @data = data
      @mode = PrintMode::NOSCALE
    end

    ##
    # Get or Set the data array
    #
    def data(data = nil)
      @data = data unless data.nil?
      @data
    end

    ##
    # Get or Set the print mode
    #
    def mode(mode = nil)
      @mode = mode unless mode.nil?
      @mode
    end

    ##
    # Print the bar graph to stdout
    #
    def print
      @data.each_with_index do |count, index|
        printf "%02d|%s\n", index, ('#' * count)
      end
    end
  end
end
