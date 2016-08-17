require 'spec_helper'
require_relative '../lib/wall/robots/flying_robot'

describe 'FlyingRobot' do
  puts 'testing flying robot..............................................'

  let(:serial) { 'F9876543210' }
  let(:place) { Place.new }
  let (:place111) { Place.new(1, 1, 1, [WeaponModule]) }
  let(:flying_robot) { FlyingRobot.new(serial, place) }

  describe '#move' do
    before do
      flying_robot.move(place111)
    end

    subject { flying_robot.place }

    context 'move in 3 axes done' do
      it { expect(subject).to eql place111 }
      it { expect([flying_robot.respond_to?(:shot), flying_robot.respond_to?(:send_message_to_headquarters)]).to eql [true, false]}
    end
  puts 'flying robot testing finished'
  end  
end