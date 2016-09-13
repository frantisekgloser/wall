require 'spec_helper'
require_relative '../../lib/wall/aggregate_powers/aggregate_powers'

include AggregatePowers

describe 'AggregatePowers' do
  puts 'testing aggregate_powers..............................................'

  let(:set) { [1, 2, 3] }
  let(:power) { 2 }
  let (:aggregation_method) { :+ }
  
  describe '#aggregate_powers' do
 
    subject { aggregate_powers(set, power, aggregation_method) }

    context 'default expectation' do
      
      it { expect(subject).to eql 14 }
    end

    context 'the smallest field' do
      let(:set) { [0] }

      it { expect(subject).to eql 0 }
    end

    context 'power 3' do
      let(:power) { 3 }

      it { expect(subject).to eql 36 }
    end

  puts 'aggregate_powers testing finished'
  end  
end