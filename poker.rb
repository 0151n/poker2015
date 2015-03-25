#poker game ruby implementation
#load game class
load 'game.rb'

#create game
game = Game.new(5)
game.round()
game.print_players()
puts ("winner was player #{game.compare_players}")
