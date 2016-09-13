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

    context 'the smallest field' do
      let(:set) { [0] }

      it { expect(subject).to eql [0] }
    end

    context 'power 3' do
      let(:power) { 3 }

      it { expect(subject).to eql [1, 8, 27] }
    end

    puts 'powers testing finished'
  end  
end