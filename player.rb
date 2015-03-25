load 'sort.rb'
#player class
class Player
	#attribute accessors
	attr_reader :hand
	attr_reader :name
	attr_reader :ranks
	attr_reader :subranks
	#constructor
	def initialize(name)
		#initialize varaibles
		@name = name
		@hand = Array.new()	
		@handsize = 0
		@subranks = []
		@ranks = []
	end
	#populate hand with cards
	def populate(used,decksize,handsize)
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
			sort(@hand)	
		end
	end
	#rank hand
	def get_rank()
		#variables
		pair = false
		same = false
		same_ = true
		usedindex = 0
		subranking = 0
		if @handsize == 0 then
			return 0
		end
		
		#straight
		same = true
		for i in 0 ... (@handsize - 1) 
			if (@hand[i + 1] % 13) == (@hand[i] % 13) + 1 and same == true then
				#do nothing
			else
				same = false
			end
		end
		if same == true then 
				@ranks << 5
				@subranks << @hand[@handsize - 1] % 13		
		end
		
		#straight-flush
		for i in 0 ... @handsize
			if @hand[0] / 13 != @hand[i] / 13 then
				same_ = false
			end
		end
		if same and same_ then
			@ranks << 1
		end
		#Full House
		for i in 2 .. 4
			if (@hand[i] % 13) == (@hand[i-1] % 13) and (@hand[i] % 13) == (@hand[i-2] % 13) then
				if i == 2 then
					if(@hand[i + 1] % 13) == (@hand[i + 2] % 13) then
						@subranks = (@hand[0] % 13) + (@hand[3] % 13);
						@ranks <<  3
						break
					end
				elsif i == 4 then
					if((@hand[i - 3] % 13) == (@hand[i - 4 ] % 13)) then
						@subranks << (@hand[0] % 13) + (@hand[4] % 13);
						@ranks <<  3
						break
					end
				end
			end
		end
		#royal flush
		if (@hand[0] / 13) == (@hand[1] / 13) and (@hand[0] / 13) == (@hand[2] / 13) and (@hand[0] / 13) == (@hand[3] / 13) and (@hand[0] / 13) == (@hand[4] / 13) then
			if (@hand[0] % 13 == 8) and (@hand[1] % 13 == 9) and (@hand[2] % 13 == 10) and (@hand[3] % 13 == 11) and (@hand[4] % 13 == 12) then
				@ranks << 0
			end
		end
		#Flush
		if(@hand[0] / 13) == (@hand[1] / 13) and (@hand[0] / 13) == (@hand[2] / 13) and (@hand[0] / 13) == (@hand[3] / 13) and (@hand[0] / 13) == (@hand[4] / 13) then
			@subranks << @hand[0] % 13;
			@ranks << 4
		end
		#four of a kind
		for i in 3 .. 4
			if(@hand[i] % 13) == (@hand[i-1] % 13) and (@hand[i] % 13) == (@hand[i-2] % 13) and (@hand[i] % 13) == (@hand[i-3] % 13) then
				@subranks << @hand[i] % 13
				@ranks << 2
			end
		end
		#three of a kind
		for i in  2 .. 4
			if (@hand[i] % 13) == (@hand[i-1] % 13) and (@hand[i] % 13) == (@hand[i-2] % 13) then
				@subranks << @hand[i] % 13
				@ranks <<  6
				break
			end
		end
		#two pairs
		for i in 1 .. 4	
			if(@hand[i] % 13) == (@hand[i-1] % 13) && usedindex != i then
				if(pair) then
					if @hand[usedindex] % 13 > @hand[i] % 13 then
						@subranks << @hand[userindex] % 13 	
					else
						@subranks << @hand[i] % 13
					end
					@ranks << 7
					break		
				else
					usedindex = i
					pair = true
				end
			end
		end
		#pair
		if pair == true then
			@subranks << @hand[usedindex] % 13
			@ranks << 8
		end
		#high card
		@ranks << 9
		@subranks << @hand[4]
		
		sort(@ranks)
		sort(@subranks)
	end
	#hand setter method
	def set_hand(in_hand)
		@hand = in_hand
	end
end
