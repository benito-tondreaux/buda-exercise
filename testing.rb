require 'test/unit'
require './graph.rb'
require './bfs.rb'

class TestGraph < Test::Unit::TestCase
  def setup
    @graph = Graph.new('red.txt')
    @nodes = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']
    @edges = [['A', 'B'], ['B', 'C'], ['C', 'D'], ['D', 'E'], ['E', 'F'], ['C', 'G'], ['G', 'H'], ['H', 'I'], ['I', 'F']]
  end

  def test_nodes
    keys = @graph.nodes.keys
    @nodes.each do |node|
      assert_include(keys, node)
    end
  end

  def recolect_names(neighbors)
    array_names = []
    neighbors.each do |neighbor|
      array_names << neighbor.name
    end

    return array_names
  end

  def test_edges
    @edges.each do |edge|
      neighbors = @graph.nodes[edge[0]].neighbors
      neighbor_names = recolect_names(neighbors)
      assert_include(neighbor_names, edge[1])
    end
  end

  def test_bfs 
    best_road_test = ['A', 'B', 'C', 'H', 'F']
    start_node = @graph.nodes['A']
    final_node = @graph.nodes['F']
    bfs = BFS.new(start_node, final_node, @graph.nodes, 'red')
    best_road = bfs.get_best_road()

    assert_equal(best_road_test, best_road)
  end

end