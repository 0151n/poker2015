load 'game.rb'
left_offset = 2

$game = Game.new(5)
$game.round()
playerimage_paths = $game.players[0].hand[0..4]
def show_all(images,ranks)
	#images
	for i in 0..3
		for j in 0..4
			images[i][j].path = "images/#{$game.players[i + 1].hand[j]}.png"
		end
	end
	#ranks
	for i in 0..3
		ranks[i].text =  $game.ranks[$game.players[i + 1].ranks[0]]
	end	
end
def hide_all(images,ranks)
	#images
	for i in 0..3
		for j in 0..4
			images[i][j].path = "images/54.png"
		end
	end
	#ranks
	for i in 0..3
		ranks[i].text =  "-----"
	end	
end
Shoes.app(title: "Poker game",
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
					@playerrank = para $game.ranks[$game.players[0].ranks[0]]
				end
				flow(top:80, left:3) do
					@playerimages = Array.new()	
					@playerimages[0] = image "images/#{$game.players[0].hand[0]}.png" 
					@playerimages[1] = image "images/#{$game.players[0].hand[1]}.png"
					@playerimages[2] = image "images/#{$game.players[0].hand[2]}.png" 
					@playerimages[3] = image "images/#{$game.players[0].hand[3]}.png" 
					@playerimages[4] = image "images/#{$game.players[0].hand[4]}.png" 
				end
			end
			stack(height:300) do
				stack(height:140) do
					border("#0F0",strokewidth:2)
					flow do
						caption "Total Bets:"
						@totalbets = caption "$#{$game.sum_bets()}"
					end		
					flow do
						caption "Round Winner:"
						@winner = caption "-----"
						caption "      "
						caption "round no."
						@rounds = caption $game.roundnum
					end
				end
				stack(height:160) do
					border("#0FF",strokewidth:2)
					flow do
						stack(width:200) do
							border("#0FF",strokewidth:2)
							flow do
								caption "Player Bet:"
								@playerbet = caption "$#{$game.players[0].bet}"
							end
							flow do
								caption " add to bet: "
								@bet_add = edit_line :width => 80
							end
							flow(margin:7) do
								@call = button "call" do
									show_all(@computerimages,@computerranks)
								end
								@fold = button "fold" do
									hide_all(@computerimages,@computerranks)
								end
								@bet = button "bet"
							end
						end
						stack(width:200) do
							@computersbets = Array.new()
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 1 Bet:"
									@computersbets[0] = para "$#{$game.players[1].bet}"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 2 Bet:"
									@computersbets[1] = para "$#{$game.players[1].bet}"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 3 Bet:"
									@computersbets[2] = para "$#{$game.players[1].bet}"
								end
							end
							stack(height:40) do
								border("#FF0",strokewidth:2)
								flow do
									para "Computer 4 Bet:"
									@computersbets[3] = para "$#{$game.players[1].bet}"
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
					@computerranks[0] = para "-----"
				end	
				flow(top:22, left:left_offset) do
					@computerimages[0] = Array.new()
					@computerimages[0][0] = image "images/54.png"
					@computerimages[0][1] = image "images/54.png"
					@computerimages[0][2] = image "images/54.png"
					@computerimages[0][3] = image "images/54.png"
					@computerimages[0][4] = image "images/54.png"
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
					@computerranks[1] = para "-----"

				end	
				flow(top:22, left:left_offset) do
					@computerimages[1] = Array.new()
					@computerimages[1][0] = image "images/54.png"
					@computerimages[1][1] = image "images/54.png"
					@computerimages[1][2] = image "images/54.png"
					@computerimages[1][3] = image "images/54.png"
					@computerimages[1][4] = image "images/54.png"
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
					@computerranks[2] = para "-----"

				end	
				flow(top:22, left:0) do
					@computerimages[2] = Array.new()
					@computerimages[2][0] = image "images/54.png"
					@computerimages[2][1] = image "images/54.png"
					@computerimages[2][2] = image "images/54.png"
					@computerimages[2][3] = image "images/54.png"
					@computerimages[2][4] = image "images/54.png"
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
					@computerranks[3] = para "-----"	
				end	
				flow(top:22, left:left_offset) do
					@computerimages[3] = Array.new()
					@computerimages[3][0] = image "images/54.png"
					@computerimages[3][1] = image "images/54.png"
					@computerimages[3][2] = image "images/54.png"
					@computerimages[3][3] = image "images/54.png"
					@computerimages[3][4] = image "images/54.png"
				end
			end
		end
	end
end
 
