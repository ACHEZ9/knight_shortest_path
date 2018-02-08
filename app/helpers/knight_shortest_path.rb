require_relative "node.rb"

class KnightShortestPath

  def get_shortest_path(from, to)
    last_node = bfs(from, to)
    get_path(last_node)
  end

  private

  def bfs(start, finish)
    queue = Queue.new
    queue << Node.new(start, nil)

    while !queue.empty? do
      cur = queue.pop
      return cur if cur.chess_notation == finish
      cur.get_valid_moves.each do |move|
        queue << Node.new(move, cur)
      end
    end

  end

  def get_path(node)
    path = [node.chess_notation]
    cur = node
    while !cur.prev.nil?
      path.insert(0, cur.prev.chess_notation)
      cur = cur.prev
    end

    path
  end

end
