#!/usr/bin/env ruby

require_relative '../lib/graph/bar.rb'
require 'test/unit'

class TestBar < Test::Unit::TestCase

  def test_init
    bar = Graph::Bar.new [5, 4, 3]
    assert_equal(bar.data, [5, 4, 3])
  end

  def test_set_data
    bar = Graph::Bar.new
    bar.data [5, 4, 3]
    assert_equal(bar.data, [5, 4, 3])
  end

  def test_set_data_bad
    bar = Graph::Bar.new
    assert_raise(ArgumentError) { bar.data 5 }
  end

  def test_set_mode
    bar = Graph::Bar.new [5, 4, 3]
    bar.mode Graph::PrintMode::SCALE
    assert_equal(bar.mode, Graph::PrintMode::SCALE)
  end

  def test_set_mode_bad
    bar = Graph::Bar.new [5, 4, 3]
    assert_raise(ArgumentError) { bar.mode 0 }
  end

  def test_set_scale
    bar = Graph::Bar.new [5, 4, 3]
    bar.mode Graph::PrintMode::SCALE
    bar.scale 3
    assert_equal(bar.scale, 3)
  end

  def test_set_scale_bad
    bar = Graph::Bar.new [5, 4, 3]
    assert_raise(ArgumentError) { bar.print 0 }
  end

  def test_print
    bar = Graph::Bar.new [5, 4, 3]
    print "\nShould Display 5, 4, 3\n"
    bar.print
  end

  def test_print_scale
    bar = Graph::Bar.new [5, 4, 3]
    bar.mode Graph::PrintMode::SCALE
    bar.scale 2
    print "\nShould Display 2, 2, 1\n"
    bar.print
  end

end
