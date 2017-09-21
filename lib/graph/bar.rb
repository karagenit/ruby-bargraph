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
    ##
    # Allows optionally setting the initial dataset as a parameter
    #
    def initialize(data = nil)
      data(data)
      mode(PrintMode::NOSCALE)
      scale(1)
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

    def scale(scale = nil)
      @scale = scale unless scale.nil?
      @scale
    end

    def print(mode = nil)
      case mode || @mode
      when PrintMode::NOSCALE
        print_noscale
      when PrintMode::AUTOSCALE
        print_autoscale
      when PrintMode::SCALE
        print_scale
      else
        raise ArgumentError, 'Invalid Print Mode', caller
      end
    end

    ##
    # Print the bar graph to stdout
    #
    def print_noscale
      print_scale 1
    end

    def print_autoscale
      # TODO: call print_scale with max divided by console width
    end

    ##
    # Prints graph with a scale. Scale of 10 means every 10 values
    # is displayed as 1 character
    #
    def print_scale(scale = nil)
      scale ||= @scale
      @data.each_with_index do |count, index|
        printf "%02d|%s\n", index, ('#' * (count / scale))
      end
    end
  end
end
