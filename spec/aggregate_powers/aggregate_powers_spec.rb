require 'spec_helper'
require_relative '../../lib/wall/aggregate_powers/aggregate_powers'

include AggregatePowers

describe 'AggregatePowers' do
  puts 'testing aggregate_powers..............................................'

  let(:set) { [1, 2, 3] }
  let(:power) { 2 }
  let (:aggregate) { :+ }
  
  describe '#aggregate_powers' do
 
    subject { aggregate_powers(set, power, aggregate) }

    context 'default expectation' do
      
      it { expect(subject).to eql 14 }

    end
  puts 'aggregate_powers testing finished'
  end  
end