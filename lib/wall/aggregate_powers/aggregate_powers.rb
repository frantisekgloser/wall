require './spec/spec_helper'
require_relative './powers'
require_relative './aggregation'
require 'pry'

module AggregatePowers 

  include Powers
  include Aggregation

  def aggregate_powers (set, power, aggregation_method)
    @set = set
    @power = power
    @aggregation_method = aggregation_method
#    @powers_set = powers(@power, @set)
    aggregation(@aggregation_method, powers(@power, @set))
  end

end  