#poker game ruby implementation
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


#define card array
cards = (deck_range).to_a

#suits and values arrays
suits = Array.new()
values = Array.new()

#defining sorting algorithm
def bubble_sort(input)
	if(input.class == Array) then
		#sort array
		changed = true
		while changed == true do 
			changed = false
			for i in 1 ... input.size()
				if input[i] % 13 < input[i - 1] % 13 then
					temp = input[i]
					input[i] = input[i -1]
					input[i - 1] = temp
					changed = true
				end 	
			end 
		end
	else
		#not an array
		puts("data sent to bubble_sort function not an array")
	end
end


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
#setup hand array
hand = Array.new()
#populate hand
for i in 1..HANDSIZE
	#loop until number that is not
	#in hand is found
	#generate number between 0 and 51
	temp = rand(deck_range)
	while(hand.include?(temp)) do	
		temp = rand(deck_range)
	end
	#push temp onto hand	
	hand << temp
end
#print to screen
for i in 0...HANDSIZE
	bubble_sort(hand)
	puts("#{value_names[values[hand[i]]]} #{suit_names[suits[hand[i]]]}\n")
end
