#player class
class Player
	def initialize(name)
		#initialize varaibles
		@name = name
		@hand = Array.new()	
		@handsize = 0
		@subrank = 0
		@rank = ""
	end
	def sort()
		#sort hand
		changed = true
		while changed == true do 
			changed = false
			for i in 1 ... @hand.size()
				if @hand[i] % 13 < @hand[i - 1] % 13 then
					temp = @hand[i]
					@hand[i] = @hand[i -1]
					@hand[i - 1] = temp
					changed = true
				end 	
			end 
		end
	end
	def populate(used,decksize,handsize)
		#populate hand
		@handsize = handsize
		for i in 1..handsize
			#loop until number that is not
			#in hand is found
			#generate number between 0 and 51
			temp = rand(Range.new(0,decksize - 1))
			while(@hand.include?(temp) or used.include?(temp))do
				temp = rand(Range.new(0,decksize - 1))
			end
			#push temp onto hand	
			@hand << temp
	
		end
	end
	def get_rank()
		#variables
		pair = false
		same = false
		same_ = false
		royal = false
		usedindex = 0
		subranking = 0
		if @handsize == 0 then
			return 0
		end
		
		#straight
		same = true
		for i in 0 ... (@handsize - 1) 
			if (@hand[i] % 13) == (@hand[i+1] % 13 + 1) and same == true then
				#do nothing
			else
				same = false
			end
		end
		if same == true then 
			@rank = "Straight"
			if @hand[0] % 13 > @hand[@handsize - 1] % 13 then
				@subrank = @hand[0]
			else
				@subrank = hand[@handsize - 1]
			end
			
		end
		
		#straigh-flush
		for i in 0 ... @handsize
			if @hand[0] / 13 != hand[i] / 13 then
				same_ = false
			end
		end
		if same and same_ then
			@rank = "Straight Flush"
			return 1
		elsif same and not same_ then
			return 1
		end
		#Full House
		for i in 2 .. 4
			if (hand[i] % 13) == (hand[i-1] % 13) and (hand[i] % 13) == (hand[i-2] % 13) then
				if i == 2 then
					if(hand[i + 1] % 13) == (hand[i + 2] % 13) then
						@subrank = (hand[0] % 13) + (hand[3] % 13);
						@rank =  "Full House"
						return 1
					end
				elsif i == 4 then
					if((hand[i - 3] % 13) == (hand[i - 4 ] % 13)) then
						@subrank = (hand[0] % 13) + (hand[4] % 13);
						@rank =  "Full House"
						return 1
					end
				end
			end
		end
		#royal flush
		if (hand[0] / 13) == (hand[1] / 13) and (hand[0] / 13) == (hand[2] / 13) and (hand[0] / 13) == (hand[3] / 13) and (hand[0] / 13) == (hand[4] / 13) then
			for i in 0 .. 4
				if (hand[i] % 13) >= 10 and (hand[i] % 13) <= 12 then
					royal = true
				else
					royal = false
				end
			end
			if royal then
				@rank = "Royal Flush"
				return 1
			end
		end
		
		#Flush
		if(hand[0] / 13) == (hand[1] / 13) and (hand[0] / 13) == (hand[2] / 13) and (hand[0] / 13) == (hand[3] / 13) and (hand[0] / 13) == (hand[4] / 13) then
			@subrank = hand[0] % 13;
			@rank = "Flush"
			return 1
		end
		#four of a kind
		for i in 3 .. 4
			if(hand[i] % 13) == (hand[i-1] % 13) and (hand[i] % 13) == (hand[i-2] % 13) and (hand[i] % 13) == (hand[i-3] % 13) then
				@subrank = hand[i] % 13
				@rank = "Four of a Kind"
				return 1
			end
		end
		#three of a kind
		for i in  2 .. 4
			if (hand[i] % 13) == (hand[i-1] % 13) and (hand[i] % 13) == (hand[i-2] % 13) then
				@subrank = hand[i] % 13
				@rank =  "Three of a Kind"
				return 1
			end
		end
		#two pairs
		for i in 1 .. 4	
			if(hand[i] % 13) == (hand[i-1] % 13) && usedindex != i then
				if(pair) then
					@subrank = (hand[usedindex] % 13) + (hand[i] % 13)
					@rank =  "Two Pairs"
					return 1			
				else
					usedindex = i
					pair = true
				end
			end
		end
		#pair
		if pair == true then
			@subrank = hand[usedindex] % 13
			@rank = "Pair"
			return 1
		end
		#high card
		@rank = "High Card"
		@subrank = hand[4]
	end
	#hand setter method
	def set_hand(in_hand)
		@hand = in_hand
	end

	#attribute accessors
	attr_reader :hand
	attr_reader :name
	attr_reader :rank
	attr_reader :subrank
end
