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
		@num_players = num_players

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
		
		#round count
		@round = 0

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
		end
	end
	#round
	def round()
		@used = []
		for i in 0...@num_players
			@players[i].populate(@used,52,5)
			@players[i].get_rank()
			@used += @players[i].hand
		end
		@round += 1 
	end
	def compare_players()
		@f_ranks = []
		@f_subranks = []
		for i in 0...@num_players
			@f_ranks << @players[i].ranks[0]
			@f_subranks << @players[i].subranks[0]
		end
		@sf_ranks = @f_ranks[0..@f_ranks.length()]
		sort(@sf_ranks)
		@max = @sf_ranks[0]
		@max_refs = []
		for i in 0...@num_players
			if @f_ranks[i] == @max then
				@max_refs << i
			end
		end
		if @max_refs.length() == 1 then
			return @max_refs[0]
		else
			@smax_subs = []
			@max_subs = []
			@sf_subranks = @f_subranks[0..@f_subranks.length()]
			for i in 0...@max_refs.length()
				@max_subs << @f_subranks[@max_refs[i]]
			end
			@smax_subs = @max_subs[0..@max_subs.length()]
			sort(@smax_subs)
			return @max_refs[@max_subs.index(@smax_subs.last)]	
		end
	end	
end

