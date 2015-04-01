left_offset = 2

Shoes.app(title: "Poker Game",
   width: 800, height: 600, resizable: false) do
	background "#FFF"
	flow do
		stack(width: 400) do
			stack(height:300) do
				border("#00F",strokewidth:2)
				flow do
					subtitle "Player", :align => left
					subtitle "             "
					flow(top: 12) do
						caption "Bank:"
						@playerbank = para "$1000", :top => 14
					end
					@playerrank = para "rank"
				end
				flow(top:80, left:3) do
					@playerimages = Array.new()	
					@playerimages[0] = image "images/0.png"
					@playerimages[1] = image "images/1.png"
					@playerimages[2] = image "images/2.png"
					@playerimages[3] = image "images/3.png"
					@playerimages[4] = image "images/4.png"
				end
			end
			stack(height:300) do
				stack(height:140) do
					border("#0F0",strokewidth:2)
					flow do
						caption "Total Bets:"
						@totalbets = caption "$100"
					end		
					flow do
						caption "Round Winner:"
						@winner = caption "Player"
						caption "      "
						caption "round no."
						@rounds = caption "10"
					end
				end
				stack(height:160) do
					border("#0FF",strokewidth:2)
					flow do
						stack(width:200) do
							border("#0FF",strokewidth:2)
							flow do
								caption "Player Bet:"
								@playerbet = caption "$20"
							end
							flow do
								caption " add to bet: "
								@bet_add = edit_line :width => 80
							end
							flow(margin:25) do
								@call = button "call"
								caption "  "
								@fold = button "fold"
							end
						end
						stack(width:200) do
							@computersbets = Array.new()
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 1 Bet:"
									@computersbets[0] = para "$10"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 2 Bet:"
									@computersbets[1] = para "$10"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 3 Bet:"
									@computersbets[2] = para "$10"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 4 Bet:"
									@computersbets[3] = para "$10"
								end
							end
						end 
					end	
				end	
			end
		end
		stack(width: 400) do
			@computerimages = Array.new()
			@computerbanks = Array.new()
			@computerranks = Array.new()
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 1", :align => left
					para "             "
					para "Bank:"
					@computerbanks[0] = para "$1000"
					para "     "
					@computerranks[0] = para "rank"
				end	
				flow(top:22, left:left_offset) do
					@computerimages[0] = Array.new()
					@computerimages[0][0] = image "images/0.png"
					@computerimages[0][1] = image "images/1.png"
					@computerimages[0][2] = image "images/2.png"
					@computerimages[0][3] = image "images/3.png"
					@computerimages[0][4] = image "images/4.png"
				end
			end
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 2", :align => left
					para "             "
					para "Bank:"
					@computerbanks[1] = para "$1000"
					para "     "
					@computerranks[1] = para "rank"

				end	
				flow(top:22, left:left_offset) do
					@computerimages[1] = Array.new()
					@computerimages[1][0] = image "images/0.png"
					@computerimages[1][1] = image "images/1.png"
					@computerimages[1][2] = image "images/2.png"
					@computerimages[1][3] = image "images/3.png"
					@computerimages[1][4] = image "images/4.png"
				end
			end
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 3", :align => left
					para "             "
					para "Bank:"
					@computerbanks[2] = para "$1000"
					para "     "
					@computerranks[2] = para "rank"

				end	
				flow(top:22, left:0) do
					@computerimages[2] = Array.new()
					@computerimages[2][0] = image "images/0.png"
					@computerimages[2][1] = image "images/1.png"
					@computerimages[2][2] = image "images/2.png"
					@computerimages[2][3] = image "images/3.png"
					@computerimages[2][4] = image "images/4.png"
				end
			end
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 4", :align => left
					para "             "
					para "Bank:"
					@computerbanks[3] = para "$1000"
					para "     "
					@computerranks[3] = para "rank"	
				end	
				flow(top:22, left:left_offset) do
					@computerimages[3] = Array.new()
					@computerimages[3][0] = image "images/0.png"
					@computerimages[3][1] = image "images/1.png"
					@computerimages[3][2] = image "images/2.png"
					@computerimages[3][3] = image "images/3.png"
					@computerimages[3][4] = image "images/4.png"
				end
			end
		end
	end
end
 
