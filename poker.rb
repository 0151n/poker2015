#poker game ruby implementation
#define constants
DECKSIZE = 52
HANDSIZE = 5

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


#define card array
cards = (0..51).to_a

#suits and values arrays
suits = Array.new()
values = Array.new()

for i in 0..51
	#sort cards into suits
	case i
		when 0..12
			suits[i] = 0
		when 13..25
			suits[i] = 1
		when 26..38
			suits[i] = 2
		when 39..51
			suits[i] = 3
	end

	#sort cards into values
	values[i] = (cards[i] % 13)
end
#setup hand array
hand = Array.new()
#populate hand
for i in 1..HANDSIZE
	#loop until number that is not
	#in hand is found
	#generate number between 0 and 51
	temp = rand(0..51)
	while(hand.include?(temp)) do	
		temp = rand(0..51)
	end
	#push temp onto hand	
	hand << temp
end
#print to screen
for i in 0..4
	puts("#{value_names[values[hand[i]]]} #{suit_names[suits[hand[i]]]}\n")
end
