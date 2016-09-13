require 'spec_helper'
require_relative '../../lib/wall/robots/flying_robot'

describe 'Place' do
  puts 'testing place.....................................................'

  WEAPONMODULE = :Weaponmodule
  TELECOMMUNICATIONMODULE = :Telecommunicationmodule
  let(:x) { 1 }
  let(:y) { 2 }
  let(:z) { 3 }
  let(:place) { Place.new }

  describe 'place creation without parameters' do

    subject { [place.place, place.modules] }

    context 'default place without modules' do
      it { expect(subject).to eql ([[0, 0, 0], []]) }
    end

    context 'place creation with coordinates only' do
      let(:place) { Place.new(x, y, z) }

      it { expect(subject).to eql ([[x, y, z], []]) }
    end

    context 'place creation with coordinates, WEAPONMODULE and TELECOMMUNICATIONMODULE' do
      let(:place) { Place.new(x, y, z, [WEAPONMODULE, TELECOMMUNICATIONMODULE]) }

      it { expect(subject).to eql ([[x, y, z], [WEAPONMODULE, TELECOMMUNICATIONMODULE]]) }
    end

  puts 'robot testing finished'
  end  
end