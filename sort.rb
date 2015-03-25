	#sorting function
	def sort(input)
		#sort hand
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
	end
	
