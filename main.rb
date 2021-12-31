require './graph.rb'
require './bfs.rb'

file_red = ARGV[0]
name_start_node = ARGV[1]
name_final_node = ARGV[2]
color_train = ARGV[3]

graph = Graph.new(file_red)
start_node = graph.nodes[name_start_node]
final_node = graph.nodes[name_final_node]
bfs = BFS.new(start_node, final_node, graph.nodes, color_train)
best_road = bfs.get_best_road()