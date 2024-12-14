require "./lib/game.rb"
require 'rspec'

describe Game do
  before do
    allow($stdout).to receive(:write) 
  end

  describe "#place_move" do
  let(:game_place_move) { described_class.new }

    context "when player selects valid empty column" do
      before do
        valid_move = '1'
        allow(game_place_move).to receive(:gets).and_return(valid_move)
      end
      it "piece placed at index [5] of column [0]" do
        player_1 = "\u{1F535}"
        game_place_move.send(:player_move)
        game_place_move.send(:place_move)
       expect(game_place_move.board[0][5]).to eq(player_1)
      end
    end

    # context "when player selects a column with one piece in it already" do
    #   it "piece enters index [1] of column" do
        
    #   end
    # end

    # context "when player selects a column that is full" do
    #   it "error message, loops back to player_move"
    # end

  end

  # describe "#valid_move" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  # describe "#column_full?" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  # describe "#place_move" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  # describe "#vertical_win?" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  # describe "#horizontal_win?" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  # describe "#diagonal_fwd_win?" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  # describe "#diagonal_bk_win?" do
  #   context "" do
  #     it "" do
        
  #     end
  #   end
  # end

  describe "#game_over?" do
  subject(:gmov) {described_class.new}
    
    context "when game over conditions are not met" do
      it "is not game over" do
        game_over = gmov.game_over?
        expect(game_over).to eq(false)
      end
    end
    context "when game over conditions are met" do
      allow(gmov.vertical_win?).to_receive(:value).and_return(4)
      # let(:vertical_win?) { 4 }
      
      it "is game over" do
        
        game_over = gmov.game_over?
        expect(game_over).to eq(true)
    end
  end
  end


end
