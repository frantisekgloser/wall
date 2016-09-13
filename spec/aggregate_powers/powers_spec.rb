require 'spec_helper'
require_relative '../../lib/wall/aggregate_powers/powers'

include Powers

describe 'Powers' do
  puts 'testing powers..............................................'

  let(:set) { [1, 2, 3] }
  let(:power) { 2 }
  
  describe '#powers' do
 
    subject { powers(power, set) }

    context 'default expectation' do
      
      it { expect(subject).to eql [1, 4, 9] }

    end
  puts 'powers testing finished'
  end  
end