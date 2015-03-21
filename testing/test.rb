load 'player.rb'
player = Player.new("i")
player.set_hand([0,14,2,3,4])
player.sort()
player.get_rank()
puts(player.rank)
