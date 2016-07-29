require './spec/spec_helper'
require_relative '../frobot'

describe 'Robot' do
  let(:serial) { 'W9876543210' }

  let(:wrobot) { Robot.new(serial) }

  before do
    place = Place.new()
    place111 = Place.new(1, 1, 1, true, false)
    place222 = Place.new(2, 2, 2, false, true)
    place333 = Place.new(3, 3, 3, true, true)
  end


  describe '#identify' do
    let(:wrobot) { Robot.new(serial) }

    subject { wrobot.identify }

    context 'identification' do
      it { expect(subject).to eql 'W9876543210' }
    end

  end  

  describe '#get_items' do
    let(:current_place) { [1, 2, 3] }

    let(:wrobot) { Robot.new(serial) }

    subject { wrobot.get_items(current_place) }

    context 'get on no place' do
      it { expect(subject).to eql [false, false] }
    end

    context 'get on place without modules' do
      let(:current_place) { [0, 0, 0] }

      it { expect(subject).to eql [false, false] }
    end

    context 'get on place with weapon module' do
      let(:current_place) { [1, 1, 1] }

      it { expect(subject).to eql [true, false] }
    end

    context 'get on place with telecommunication module' do
      let(:current_place) { [2, 2, 2] }

      it { expect(subject).to eql [false, true] }
    end

    context 'get on place with both modules' do
      let(:current_place) { [3, 3, 3] }

      it { expect(subject).to eql [true, true] }
    end

  end  

  describe '#install_items' do
    let(:items) { [false, false] }

    before do
      wrobot.install_items(items)
    end

    subject { [wrobot.respond_to?(:shot), wrobot.respond_to?(:send_message_to_headquarters)] }

    context 'install nothing' do

      it { expect(subject).to eql [false, false] }
    end

    context 'install weapon module' do
      let(:items) { [true, false] }

      it { expect(subject).to eql [true, false] }
    end

    context 'install telecommunication module' do
      let(:items) { [false, true] }

      it { expect(subject).to eql [false, true] }
    end

    context 'install both modules' do
      let(:items) { [true, true] }

      it { expect(subject).to eql [true, true] }
    end

  end

  describe '#move' do
    let(:x) { 7 }
    let(:y) { 8 }
    let(:z) { 9 }
    let(:serial_number) { 'W9876543210' }

    let(:wrobot) { Robot.new(serial_number) }

    subject { wrobot.move(x, y, z) }

    context 'move in 3 axes is not possible for wheel robot' do
      it { expect(subject).to eql [0, 0, 0] }
    end
    
    context 'move done' do
      let(:x) { 0 }

      it { expect(subject).to eql [0, 8, 9] }

    end

  end  

end