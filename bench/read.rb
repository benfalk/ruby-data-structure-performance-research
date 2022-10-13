#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark/ips'
require_relative '../lib/structures'

hash = { foo: 'foo', bar: 'bar', baz: 'baz' }
struct = StructData.new('foo', 'bar', 'baz')
kwarg_struct = KwargStructData.new(foo: 'foo', bar: 'bar', baz: 'baz')
open_struct = OpenStruct.new(foo: 'foo', bar: 'bar', baz: 'baz')
postional_poro = PositionalPoro.new('foo', 'bar', 'baz')
kwarg_poro = KwargPoro.new(foo: 'foo', bar: 'bar', baz: 'baz')

Benchmark.ips do |bench|
  bench.report('hash') do
    hash[:foo]
  end

  bench.report('struct') do
    struct.foo
  end

  bench.report('struct-as-hash') do
    struct[:foo]
  end

  bench.report('kwarg-struct') do
    kwarg_struct.foo
  end

  bench.report('kwarg-struct-as-hash') do
    kwarg_struct[:foo]
  end

  bench.report('open-struct') do
    open_struct.foo
  end

  bench.report('open-struct-as-hash') do
    open_struct[:foo]
  end

  bench.report('postional-poro') do
    postional_poro.foo
  end

  bench.report('kwarg-poro') do
    kwarg_poro.foo
  end

  bench.compare!
end
