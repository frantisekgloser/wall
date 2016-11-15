require 'spec_helper'
require_relative '../../lib/wall/game/game'

describe 'Game' do
  puts 'testing game..............................................'

  let(:game) { Game.new }
  let(:position) { [1, 1] }
  
  describe '#up' do

    subject { game.up(position) }

    context 'if can up' do
      
      it { expect(subject).to eql [2, position[1]] }  

    end

    context 'if cannot up' do
      let(:position[0]) { Game:GRID }

      it { expect(subject).to eql position }

    end

  end

  describe '#down' do

    subject { game.down(position) }

    context 'if can down' do
      
      it { expect(subject).to eql [0, position[1]] }

    end

    context 'if cannot down' do
      let(:position[0]) { 0 }

      it { expect(subject).to eql position }

    end

  end

  describe '#left' do

    subject { game.left(position) }

    context 'if can left' do
      
      it { expect(subject).to eql [position[0], 0] }

    end

    context 'if cannot left' do
      let(:position[1]) { 0 }

      it { expect(subject).to eql position }

    end

  end

  describe '#right' do

    subject { game.right(position) }

    context 'if can right' do
      
      it { expect(subject).to eql [position[0], 2] }

    end

    context 'if cannot right' do
      let(:position[1]) { Game:GRID }

      it { expect(subject).to eql position }

    end

  end

  describe '#save' do

    subject { game.save }

    context 'save game' do
      
      it { expect(File).to receive(:open) }

    end

  end

  describe '#load' do

    subject { Game::load }

    context 'load' do
      
      it { expect(File).to receive(:open) }

    end

  end
  
  puts 'game testing finished' 

end