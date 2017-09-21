#!/usr/bin/env ruby

require_relative '../lib/graph/bar.rb'
require 'test/unit'

class TestBar < Test::Unit::TestCase

  def test_init
    bar = Graph::Bar.new [5, 4, 3]
    assert_equal(bar.data, [5, 4, 3])
    bar.print
  end

  def test_set
    bar = Graph::Bar.new
    bar.data [5, 4, 3]
    assert_equal(bar.data, [5, 4, 3])
    bar.print
  end

  def test_set_mode
    bar = Graph::Bar.new [5, 4, 3]
    bar.mode Graph::PrintMode::SCALE
    assert_equal(bar.mode, Graph::PrintMode::SCALE)
    bar.print
  end

end
