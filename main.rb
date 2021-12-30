require './graph.rb'
require './bfs.rb'

graph = Graph.new('red.txt')
start_node = graph.nodes['A']
final_node = graph.nodes['F']
bfs = BFS.new(start_node, final_node, graph.nodes, 'red')
best_road = bfs.get_best_road()