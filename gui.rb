load 'game.rb'
#local variables
left_offset = 2
called = false
folded = false

$game = Game.new(5)
$game.round()
playerimage_paths = $game.players[0].hand[0..4]
def show_all()
	#images
	for i in 0..3
		for j in 0..4
			@computerimages[i][j].path = "images/#{$game.players[i + 1].hand[j]}.png"
		end
	end
	#ranks
	for i in 0..3
		@computerranks[i].text =  $game.ranks[$game.players[i + 1].ranks[0]]
	end	
end
def hide_all()
	#images
	for i in 0..3
		for j in 0..4
			@computerimages[i][j].path = "images/54.png"
		end
	end
	#ranks
	for i in 0..3
		@computerranks[i].text =  "-----"
	end	
end
def reset_bets()
	@playerbet.text = "$#{$game.players[0].bet}"
	@playerbank.text = "$#{$game.players[0].bank}"
	@totalbets.text = "$#{$game.sum_bets()}"
	for i in 0..3
		@computersbets[i].text = "$#{$game.players[i + 1].bet}"
		@computerbanks[i].text = "$#{$game.players[i + 1].bank}"
	end
end
def reset_all()
	puts "run"
	@totalbets.text = "$0"
	for i in 0..4
		@playerimages[i].path = "images/#{$game.players[0].hand[i]}.png" 
	end
	@playerrank.text =  $game.ranks[$game.players[0].ranks[0]]
	@winner.text = "-----"
	@rounds.text = $game.roundnum
	puts "done"
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
						@playerbank = para "$#{$game.players[0].bank}", :top => 14
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
									if !called then
										show_all()
										@outcome = $game.compare_players(Array.new(5,true),0)
										if @outcome == -1 then
											@winner.text = "Game was a Tie"
											#add functionality for tie
										else
											@winner.text = $game.players[@outcome].name
											$game.players[@outcome].set_bank($game.sum_bets())
											reset_bets()
										end
										called = true
									end
								end
								@fold = button "fold" do
									if !folded then
										show_all()
										$game.players[0].fold
										@outcome = $game.compare_players(Array.new(5,true),0)
										if @outcome == -1 then
											@winner.text = "Game was a Tie"
											#add functionality for tie
										else
											@winner.text = $game.players[@outcome].name
											$game.players[@outcome].set_bank($game.sum_bets())
											reset_bets()
										end
										folded = true
									end
								end
								@bet = button "bet" do
									if @bet_add.text != "" and @bet_add.text.to_i > 0 and @bet_add.text.to_i <= $game.players[0].bank and !called and !folded then
										$game.get_bets(@bet_add.text.to_i)
										$game.players[0].set_bet(@bet_add.text.to_i)
										reset_bets()
									end	
								end
							end
							flow(margin:0) do
								#next round
								@next = button "next round" do
									$game.round()
									reset_all()
									hide_all()
									called = folded = false
								end
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
					@computerbanks[0] = para "$#{$game.players[1].bank}"
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
					@computerbanks[1] = para "$#{$game.players[2].bank}"
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
					@computerbanks[2] = para "$#{$game.players[3].bank}"
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
					@computerbanks[3] = para "$#{$game.players[4].bank}"
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
 
