require 'spec_helper'
require_relative '../../lib/wall/game/game'

describe 'Game' do
  puts 'testing game..............................................'

  let(:game) { Game.new }
  let(:position) { [1, 1] }
  let(:file) { double('file') } 
  
  describe '#up' do

    subject { game.up }

    context 'if can up' do
      
      it { expect(subject).to eql [2, position[1]] }  

    end

    context 'if cannot up' do
      before do
      
        game.position[0] = Game::GRID

      end

      it { expect(subject).to eql [Game::GRID, position[1]] }

    end

  end

  describe '#down' do

    subject { game.down }

    context 'if can down' do
      
      it { expect(subject).to eql [0, position[1]] }

    end

    context 'if cannot down' do
      before do
      
        game.position[0] = 0

      end

      it { expect(subject).to eql [0, position[1]] }

    end

  end

  describe '#left' do

    subject { game.left }

    context 'if can left' do
      
      it { expect(subject).to eql [position[0], 0] }

    end

    context 'if cannot left' do
      before do
      
        game.position[1] = 0

      end

      it { expect(subject).to eql [position[0], 0] }

    end

  end

  describe '#right' do

    subject { game.right }

    context 'if can right' do
      
      it { expect(subject).to eql [position[0], 2] }

    end

    context 'if cannot right' do
      let(:position[1]) { Game:GRID }

      it { expect(subject).to eql [position[0], 2] }

    end

  end

  describe '#save' do

    before do
          
      allow(File).to receive(:open).and_return(file)
      allow(file).to receive(:write)
      allow(file).to receive(:close)

      game.save
    end

    context 'save game' do
      
      it { expect(File).to have_received(:open).with("./game.txt", "w") }
      it { expect(file).to have_received(:write).with(position) } 
      it { expect(file).to have_received(:close) }

    end

  end

  describe '#load' do

    before do
          
      allow(File).to receive(:open).and_return(file)    
      allow(file).to receive(:read)
      allow(file).to receive(:close)

      game.load
    end


    context 'load' do
      
      it { expect(File).to have_received(:open).with("./game.txt", "r") }
      it { expect(file).to have_received(:read) } 
      it { expect(file).to have_received(:close) }

    end

  end
  
  puts 'game testing finished' 

end