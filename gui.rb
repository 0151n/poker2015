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
						para "$1000", :top => 14
					end
					para "rank"
				end
				flow(top:80, left:3) do	
					image "images/0.png"
					image "images/1.png"
					image "images/2.png"
					image "images/3.png"
					image "images/4.png"
				end
			end
			stack(height:300) do
				stack(height:140) do
					border("#0F0",strokewidth:2)
					flow do
						caption "Total Bets:"
						caption "$100"
					end		
					flow do
						caption "Round Winner:"
						caption "Player"
						caption "      "
						caption "round no."
						caption "10"
					end
				end
				stack(height:160) do
					border("#0FF",strokewidth:2)
					flow do
						stack(width:200) do
							border("#0FF",strokewidth:2)
							flow do
								caption "Player Bet:"
								caption "$20"
							end
							flow do
								caption " add to bet: "
								edit_line :width => 80
							end
							flow(margin:25) do
								button "call"
								caption "  "
								button "fold"
							end
						end
						stack(width:200) do
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 1 Bet:"
									para "$10"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 2 Bet:"
									para "$10"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 3 Bet:"
									para "$10"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 4 Bet:"
									para "$10"
								end
							end
						end 
					end	
				end	
			end
		end
		stack(width: 400) do
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 1", :align => left
					para "             "
					para "Bank:"
					para "$1000"
					para "     "
					para "rank"
				end	
				flow(top:22, left:left_offset) do
					image "images/0.png"
					image "images/1.png"
					image "images/2.png"
					image "images/3.png"
					image "images/4.png"
				end
			end
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 2", :align => left
					para "             "
					para "Bank:"
					para "$1000"
					para "     "
					para "rank"

				end	
				flow(top:22, left:left_offset) do
					image "images/0.png"
					image "images/1.png"
					image "images/2.png"
					image "images/3.png"
					image "images/4.png"
				end
			end
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 3", :align => left
					para "             "
					para "Bank:"
					para "$1000"
					para "     "
					para "rank"

				end	
				flow(top:22, left:0) do
					image "images/0.png"
					image "images/1.png"
					image "images/2.png"
					image "images/3.png"
					image "images/4.png"
				end
			end
			stack(height: 150) do
				border("#F00",strokewidth:1)
				flow(left: 100) do
					para "Computer 4", :align => left
					para "             "
					para "Bank:"
					para "$1000"
					para "     "
					para "rank"	
				end	
				flow(top:22, left:left_offset) do
					image "images/0.png"
					image "images/1.png"
					image "images/2.png"
					image "images/3.png"
					image "images/4.png"
				end
			end
		end
	end
end 
