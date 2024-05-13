# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'


class StackTest < Minitest::Test
  # BEGIN
  def test_push
    stack = Stack.new
    stack.push! 'Ruby'
    assert(stack.to_a == ['Ruby'])
  end
  def test_pop
    stack = Stack.new
    stack.push! 'Ruby'
    stack.pop!
    assert{stack.size == 0}
  end
  def test_clear
    stack = Stack.new
    stack.push! 'Ruby'
    stack.clear!
    assert(stack.to_a == [])
  end
  def test_empty?
    stack = Stack.new
    stack.push! 'Ruby'
    stack.clear!
    assert(stack.empty? == true)
  end
  # END
end

# test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
# raise 'StackTest has not tests!' if test_methods.empty?
