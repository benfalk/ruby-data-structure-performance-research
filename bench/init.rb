#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark/ips'
require_relative '../lib/structures'

Benchmark.ips do |bench|
  bench.report('hash') do
    { foo: 'foo', bar: 'bar', baz: 'baz' }
  end

  bench.report('struct') do
    StructData.new('foo', 'bar', 'baz')
  end

  bench.report('kwarg-struct') do
    KwargStructData.new(foo: 'foo', bar: 'bar', baz: 'baz')
  end

  bench.report('open-struct') do
    OpenStruct.new(foo: 'foo', bar: 'bar', baz: 'baz')
  end

  bench.report('postional-poro') do
    PositionalPoro.new('foo', 'bar', 'baz')
  end

  bench.report('kwarg-poro') do
    KwargPoro.new(foo: 'foo', bar: 'bar', baz: 'baz')
  end

  bench.compare!
end
