require 'spec_helper'
require_relative '../lib/wall/robots/flying_robot'

describe 'Robot' do
  puts 'testing wheel robot.....................................................'

  let(:serial) { 'W9876543210' }
  let(:place) { Place.new }
  let(:wheel_robot) { Robot.new(serial, place) }

  describe '#identify' do
    let(:wheel_robot) { Robot.new(serial, place) }

    subject { wheel_robot.identify }

    context 'identification' do
      it { expect(subject).to eql 'W9876543210' }
    end
  end  

  describe '#get_items' do

    subject { wheel_robot.get_items }

    context 'get on place without modules' do

      it { expect(subject).to eql [] }
    end

    context 'get on place with weapon module' do
      let (:place111) { Place.new(1, 1, 1, [WeaponModule]) }
      let(:wheel_robot) { Robot.new(serial, place111) }

      it { expect(subject).to eql [WeaponModule] }
    end

    context 'get on place with telecommunication module' do
      let (:place022) { Place.new(0, 2, 2, [TelecommunicationModule]) }
      let(:wheel_robot) { Robot.new(serial, place022) }

      it { expect(subject).to eql [TelecommunicationModule] }
    end

    context 'get on place with both modules' do
      let (:place033) { Place.new(0, 3, 3, [WeaponModule, TelecommunicationModule]) }
      let(:wheel_robot) { Robot.new(serial, place033) }

      it { expect(subject).to eql [WeaponModule, TelecommunicationModule] }
    end
  end  

  describe '#move' do
    let(:wheel_robot) { Robot.new(serial, place) }
    let (:place111) { Place.new(1, 1, 1, [WeaponModule]) }

    before do
      wheel_robot.move(place111)
    end

    subject { wheel_robot.place }

    context 'move in 3 axes is not possible for wheel robot' do
      it { expect(subject).to eql place }
    end
    
    context 'move done' do
      let (:place033) { Place.new(0, 3, 3, [WeaponModule, TelecommunicationModule]) }

      before do
        wheel_robot.move(place033)
      end

      it { expect(subject).to eql place033 }
      it { expect([wheel_robot.respond_to?(:shot), wheel_robot.respond_to?(:send_message_to_headquarters)]).to eql [true, true]}

    end
  puts 'wheel robot testing finished'
  end  
end