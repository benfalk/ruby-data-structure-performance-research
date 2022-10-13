# frozen_string_literal: true

require 'ostruct'

StructData = Struct.new(:foo, :bar, :baz)

KwargStructData = Struct.new(:foo, :bar, :baz, keyword_init: true)

# Data via postion like StructData
class PositionalPoro
  attr_accessor :foo, :bar, :baz

  def initialize(foo = nil, bar = nil, baz = nil)
    @foo = foo
    @bar = bar
    @baz = baz
  end
end

# Data viw kwarg like StructData
class KwargPoro
  attr_accessor :foo, :bar, :baz

  def initialize(foo: nil, bar: nil, baz: nil)
    @foo = foo
    @bar = bar
    @baz = baz
  end
end
