#game class
#dependecies:
#player class
load 'player.rb'

#define constants
DECKSIZE = 52
HANDSIZE = 5

class Game
	#attribute accesors
	attr_reader :players
	
	def initialize(num_players)

		#define deck range
		@deck_range = Range.new(0,DECKSIZE - 1)

		#define players array		
		@players = Array.new(num_players)

		#names of values
		@value_names = ["Two of",
			       "Three of",
			       "Four of",
			       "Five of",
			       "Six of",
			       "Seven of",
			       "Eight of",
			       "Nine of",
			       "Ten of",
			       "Jack of",
			       "Queen of",
			       "King of",
			       "Ace of"]

		#names of suits
		@suit_names = ["Hearts","Clubs","Spades","Diamonds"]

		#hand ranks
		@ranks = ["Royal Flush",
			 "Straight Flush",
			 "Four of a Kind",
			 "Full House",
			 "Flush",
			 "Straight",
			 "Three of a Kind",
			 "Two Pairs",
			 "One Pair",
			 "High Card"]

		#define card array
		@cards = (@deck_range).to_a

		#!may not be needed!

		#suits and values arrays
		@suits = Array.new()
		@values = Array.new()

		for i in @deck_range
			#sort cards into suits
			case i
				when 0...13
					@suits[i] = 0
				when 13...26
					@suits[i] = 1
				when 26...39
					@suits[i] = 2
				when 39...52
					@suits[i] = 3
			end

			#sort cards into values
			@values[i] = (@cards[i] % 13)
		end
		@used = []
		for i in 0...num_players
			@players[i] = Player.new("blank")
			@players[i].populate(@used,52,5)
			@players[i].get_rank()
			@used += @players[i].hand 
		end
	end
end
