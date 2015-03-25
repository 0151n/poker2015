#poker game ruby implementation
#load player class
load "sort.rb"
load "player.rb"

#define constants
DECKSIZE = 52
HANDSIZE = 5

deck_range = Range.new(0,DECKSIZE - 1)

#names of values
value_names = ["Two of",
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
suit_names = ["Hearts","Clubs","Spades","Diamonds"]
ranks = ["Royal Flush",
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
cards = (deck_range).to_a

#suits and values arrays
suits = Array.new()
values = Array.new()

for i in deck_range
	#sort cards into suits
	case i
		when 0...13
			suits[i] = 0
		when 13...26
			suits[i] = 1
		when 26...39
			suits[i] = 2
		when 39...52
			suits[i] = 3
	end

	#sort cards into values
	values[i] = (cards[i] % 13)
end

#create player
player = Player.new("player")
player.populate([],52,5)
sort(player.hand)

#print to screen
for i in 0...HANDSIZE
	puts("#{value_names[values[player.hand[i]]]} #{suit_names[suits[player.hand[i]]]}\n")
end
puts("--------------------")
player.get_rank()
for i in Range.new(0,player.ranks.length - 1)
	puts("#{ranks[player.ranks[i]]}|#{player.subranks[i]}\n")
end
