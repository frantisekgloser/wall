require 'spec_helper'
require_relative '../../lib/wall/termostat/termostat'

describe Termostat do
  puts 'testing termostat.................................................'
  let(:termostat) { Termostat.new }

  describe '#initialize' do
    let(:room_temperature) { 20 }
    let(:set_temperature) { 20 }

    let(:termostat) { Termostat.new(room_temperature, set_temperature) }

    subject { termostat.heating? }

    context 'when both temperatures are the same' do
      it { expect(subject).to eql false }
    end

    context 'when room temperature is greater' do
      let(:room_temperature) { 50 }

      it { expect(subject).to eql false }
    end

    context 'when room temperature is lower' do
      let(:room_temperature) { -10 }

      it { expect(subject).to eql true }
    end
  end  

  describe '#temperature' do
    subject { termostat.temperature }


    it { expect(subject).to eql Termostat::DEFAULT_TEMPERATURE }
  end

  describe '#set_temperature' do
    subject { termostat.set_temperature (desired_temperature) }

    context 'temperature set manually' do
      let(:desired_temperature) { 40 }

      before do
        termostat.set_temperature (desired_temperature)
      end

      it { expect(subject).to eql desired_temperature }
    end

    context 'default' do
      let(:desired_temperature) { Termostat::DEFAULT_SET_TEMPERATURE }

      it { expect(subject).to eql Termostat::DEFAULT_SET_TEMPERATURE }
    end
  end

  describe '#heating?' do
    subject { termostat.heating? }

    context 'set temperature is not greater than current temperature' do
      before do
        termostat.set_temperature (0)
      end

      it { expect(subject).to eql false }
    end

    context 'set temperature is greater than current temperature' do
      before do
        termostat.set_temperature (100)
      end

      it { expect(subject).to eql true }
    end
  puts 'termostat testing finished'
  end
end
