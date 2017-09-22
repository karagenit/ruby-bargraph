##
# This module contains tools for analyzing and graphing data arrays
#
module Graph
  ##
  # Modes for printing the graph
  #
  module PrintMode
    ##
    # No scale factor
    #
    NOSCALE = 1
    ##
    # Manually set scale factor
    #
    SCALE = 2
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
      unless data.nil?
        raise ArgumentError, 'Data Must Be Enumerable!', caller unless
          data.is_a? Enumerable
        @data = data
      end
      @data
    end

    ##
    # Get or Set the print mode
    #
    def mode(mode = nil)
      unless mode.nil?
        raise ArgumentError, 'Invalid Print Mode!', caller unless
          [PrintMode::SCALE, PrintMode::NOSCALE].include? mode
        @mode = mode
      end
      @mode
    end

    ##
    # Get or Set th print scale
    #
    def scale(scale = nil)
      unless scale.nil?
        raise ArgumentError, 'Invalid Scale!', caller unless
          scale > 0
        @scale = scale
      end
      @scale
    end

    ##
    # Print the graph to stdout, based on the print mode & scale
    #
    def print(mode = nil)
      case mode || @mode
      when PrintMode::NOSCALE
        print_noscale
      when PrintMode::SCALE
        print_scale
      else
        raise ArgumentError, 'Invalid Print Mode', caller
      end
    end

    ##
    # Print the graph without any scaling
    #
    def print_noscale
      print_scale 1
    end

    ##
    # Prints graph with a scale. Scale of 10 means every 10 values
    # is displayed as 1 character
    #
    def print_scale(scale = nil)
      scale ||= @scale
      raise ArgumentError, 'Invalid Scale', caller unless scale > 0
      @data.each_with_index do |count, index|
        printf "%02d|%s\n", index, ('#' * (count / scale))
      end
    end
  end
end
