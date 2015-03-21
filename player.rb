#player class
class Player
	def initialize(name)
		#initialize varaibles
		@name = name
		@hand = Array.new()	
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
	#attribute accessors
	attr_reader :hand
end

