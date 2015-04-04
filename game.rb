#game class
#dependencies
#player class
load 'player.rb'

#define constants
DECKSIZE = 52
HANDSIZE = 5

class Game
	#attribute accesors
	attr_reader :players
	attr_reader :ranks	
	attr_reader :roundnum
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
		@roundnum = 0

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
			@players[i] = Player.new("#{i}")
		end
	end
	#round
	def round()
		@used = []
		for i in 0...@num_players
			@players[i].reset()
			@players[i].populate(@used,52,5)
			@players[i].get_rank()
			@used += @players[i].hand
		end
		@roundnum += 1 
	end
	def compare_players(ex_group, resolution)	
		#rank arrays
		@f_ranks= []
		@f_subranks = []

		#populate rank arrays
		for i in 0...@num_players
			#check that rank is not nil
			if @players[i].ranks[resolution] == nil or !ex_group[i] or @players[i].folded then
				#set f_rank element to a non-rank value so that it is discarded
				@f_ranks << 10
				@f_subranks << 10
			else
				@f_ranks << @players[i].ranks[resolution]
				@f_subranks << @players[i].subranks[resolution]
			end
		end

		#copy and sort sf_ranks from f_ranks
		@sf_ranks = @f_ranks[0..@f_ranks.length()]
		sort(@sf_ranks)

		#get max rank value from sf_ranks
		@max = @sf_ranks[0]

		#initialize max_refs array
		@max_refs = []

		#check for high card draw
		if(@max == 10) then
			return -1
		end

		#populate max_refs with
		for i in 0...@num_players
			if @f_ranks[i] == @max then
				@max_refs << i
			end
		end
		#return winning player if only one had the maximum rank
		if @max_refs.length() == 1 then
			return @max_refs[0]
		#check subrank if two players have the same rank
		else
			#initialize arrays
			@smax_subs = []
			@max_subs = []
			#generate max_subs
			for i in 0...@max_refs.length()
				@max_subs << @f_subranks[@max_refs[i]]
			end
			#copy and sort smax_subs
			@smax_subs = @max_subs[0..@max_subs.length()]
			sort(@smax_subs)
			#initialize subrank match array
			@smatch = []
			for i in 0...@max_subs.length()
				if @max_subs[i] == @smax_subs.last then
					@smatch << @max_refs[i]
				end
			end
			if @smatch.length() == 1 then
				#return winner
				return @max_refs[@max_subs.index(@smax_subs.last)]
			else
				#create and populate exclusion array
				@exclude = Array.new(@num_players,false)
				for i in 0...@smatch.length()
					@exclude[i] == true
				end
				#call self to check next level of ranks
				return compare_players(@exclude, resolution + 1)	
			end
		end
	end

	def print_player(player)
		puts ("-player #{player}-")
		for j in 0...5
			puts("#{@value_names[@values[@players[player].hand[j]]]} #{@suit_names[@suits[@players[player].hand[j]]]}")
		end
		puts ("-----------")
	end

	def print_players()
		for i in 0...@num_players
			print_player(i)
		end
	end
	def print_outcome()
		@outcome = compare_players(Array.new(5,true),0)
		if @outcome == -1 then
			puts ("Game was a tie")
		else
			puts ("Player #{@players[@outcome].name} won")
		end
	end
	def sum_bets() 
		@sum = 0
		for i in 0...@num_players
			@sum += @players[i].bet
		end
		return @sum
	end
	#placeholder get_bets function
	def get_bets(bet)
		for i in 1...@num_players
			if bet <= @players[i].bank and !@players[i].folded then
				@players[i].set_bet(bet)
			else
				#puts "fold #{i}"
				@players[i].fold
			end 
		end
	end
end

