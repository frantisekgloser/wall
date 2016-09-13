require 'spec_helper'
require_relative '../../lib/wall/aggregate_powers/aggregation'

include Aggregation

describe 'Aggregation' do
  puts 'testing aggregation..............................................'

  let(:powers_set) { [1, 4, 9] }
  let (:aggregation_method) { :+ }
  
  describe '#aggregation' do
 
    subject { aggregation(aggregation_method, powers_set) }

    context 'default expectation' do
      
      it { expect(subject).to eql 14 }

    end
  puts 'aggregation testing finished'
  end  
end