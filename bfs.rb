class BFS
  
  # Initialize values
  def initialize(start_node, final_node, graph, train_color)
    @start_node = start_node
    @final_node = final_node
    @graph = graph
    @train_color =  train_color == nil ? 'none' : train_color
    @road ={}
  end

  # Generate the best road into the node start and the node end
  def get_best_road
    
    delete_stations()
  
    initialize_nodes()
  
    create_best_road()
  
    return generate_correct_road(@final_node,  [])
  
  end

  private

  # Run the BFS algorithm to generate the best road
  def create_best_road
    queue = []
    finish = false
    queue << @start_node 
  
    while queue.length != 0 and not finish 
      current_node = queue.shift
      current_node.neighbors.each do |neighbor|
        update_neighbor(current_node, neighbor, queue, finish)
      end
    end
  end

  # For each neighbor update this values and add this node into the road
  def update_neighbor(current_node, neighbor, queue, finish)
    if not neighbor.visited
      neighbor.visited = true
      @road[neighbor.name] = current_node
      queue << neighbor
      if neighbor.name == @final_node.name
        finish = true
      end
    end
  end

  # Update the values for each node to default values
  def initialize_nodes
    (@graph.keys).each do |node|
      if @graph[node].name != @start_node.name
        @graph[node].visited = false
      end
    end
  end

  # For each node, check the neighbors and delete the station that does not correspond by the station color 
  def delete_neighbors(node, queue_init)
    node.neighbors.each do |neighbor|
      if not neighbor.visited
        neighbor.visited = true
        queue_init << neighbor 
        if not check_color!(neighbor) and neighbor.neighbors.length != 0
          node.neighbors.concat(neighbor.neighbors)
        end
      end
    end
  
    return queue_init
  end

  # For each node, check the 'delete_neighbors' to update de graph
  def delete_stations
    queue_init = []
    queue_init << @start_node
  
    while queue_init.length != 0
      current_node = queue_init.shift
      queue_init = delete_neighbors(current_node, queue_init)
    end
  end

  # Verify that the train will can visit the current station
  def check_color!(current_node)
    if @train_color == current_node.color or @train_color == 'none' or current_node.color == 'none'
      return true
    else
      return false
    end
  end

  # Build a list of station from the road dictionary
  def generate_correct_road(current_node, road_correct)
  
    road_correct << current_node.name
  
    if current_node.name != @start_node.name
      generate_correct_road(@road[current_node.name], road_correct)
    else
      print_correct_road(road_correct)
      return road_correct.reverse
    end
  end

  # Show the correct road on console
  def print_correct_road(road_correct)
    puts '---------------------------------------'
    puts 'Best road:'
    road_correct.reverse.each do |station|
      print station
      if road_correct[0] != station
        print ' -> '
      else 
        puts
      end
    end
  end
end

