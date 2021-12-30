class Graph

  attr_accessor :nodes

  # Load the red of stations
  def initialize(file_path)
    @file = File.open(file_path)
    @nodes = {}
    build_nodes()
    build_edges()
    @file.close
  end

  private

  # Read file and save the stations like nodes
  def build_nodes
    n_nodes = @file.gets.to_i
    while n_nodes > 0
      values = (@file.gets).strip.split(",")
      add_node(values[0], values[1])
      n_nodes -= 1
    end
  end

  # Add node at the graph
  def add_node(name, color)
    @nodes[name] = Node.new(name, color)
  end

  # Load each connection of stations like edge of the graph
  def build_edges
    n_edges = @file.gets.to_i
    while n_edges > 0
      nodes_edge = (@file.gets).strip.split(",")
      node_start = @nodes[nodes_edge[0]]
      node_end = @nodes[nodes_edge[1]]
      node_start.add_edges(node_end)
      node_end.add_edges(node_start)
      n_edges -= 1
    end
  end

end

class Node
  attr_accessor :name, :color, :neighbors, :visited

  # Initialize values
  def initialize(name, color)
    @name = name
    @color = color
    @visited = false
    @neighbors = []
  end

  # Add neighbor at the node 
  def add_edges(neighbor)
    @neighbors << neighbor
  end
  
end