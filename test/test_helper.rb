# coding: utf-8
require "coveralls"
require "simplecov"
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/test/'
  add_filter '/bundle/'
end

Bundler.require
require "flog"
require "test/unit"
require "mocha/setup"

class TestLogger
  attr_accessor :debugs, :infos, :errors

  def initialize
    @debugs = []
    @infos = []
    @errors = []
  end

  def debug?
    true
  end

  def info?
    true
  end

  def debug(message)
    @debugs += message.split("\n")
  end

  def info(message)
    @infos += message.split("\n")
  end

  def error(message)
    @errors += message.split("\n")
  end
end
