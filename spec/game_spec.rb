require "./lib/game.rb"
require 'rspec'

describe Game do
  before do
    allow($stdout).to receive(:write) 
  end
  # describe "#valid_move" do
  # subject(:game_input) { described_class.new }


  #   context "when user enters valid move" do
  #     it "returns a valid number" do
  #       subject.instance_variable_set(:@move, 1)
  #       expect(game_input.valid_move).to be(true)
  #     end
  #   end


  #   context "when user enters invalid gibberish" do
  #     it "sends back to player_move" do
  #       subject.instance_variable_set(:@move, "a")
  #       expect(game_input.valid_move).to be("invalid input, please try again")
  #     end
  #   end
  # end

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
end
