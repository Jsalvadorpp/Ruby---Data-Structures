class Node
    attr_accessor :x,:y,:childList,:parentNode

    def initialize(xCoord,yCoord)
        @x = xCoord
        @y = yCoord
        @childList = []
        @parentNode = nil
    end
end

class Board
    attr_accessor :cellList

    def initialize
        @cellList = []
        (1..8).reverse_each {|x| (1..8).each {|y| @cellList.push(Node.new(x,y))}}
    end
end

class Knight

    def initialize
        @allMoves = Board.new
        @allMoves.cellList.each {|cell| setChilds(cell)}  #set all possible moves
    end

    def setChilds(node)
        node.childList.push(node_at(node.x+2,node.y-1)) unless node_at(node.x+2,node.y-1).nil?
        node.childList.push(node_at(node.x+2,node.y+1)) unless node_at(node.x+2,node.y+1).nil?
        node.childList.push(node_at(node.x+1,node.y-2)) unless node_at(node.x+1,node.y-2).nil?
        node.childList.push(node_at(node.x+1,node.y+2)) unless node_at(node.x+1,node.y+2).nil?
        node.childList.push(node_at(node.x-1,node.y-2)) unless node_at(node.x-1,node.y-2).nil?
        node.childList.push(node_at(node.x-1,node.y+2)) unless node_at(node.x-1,node.y+2).nil?
        node.childList.push(node_at(node.x-2,node.y-1)) unless node_at(node.x-2,node.y-1).nil?
        node.childList.push(node_at(node.x-2,node.y+1)) unless node_at(node.x-2,node.y+1).nil?
    end

    def node_at(xCoord,yCoord)
        return (xCoord).between?(1,8) && (yCoord).between?(1,8) ?  @allMoves.cellList.find {|node| node.x == xCoord && node.y == yCoord} : nil
    end

    def KnightMoves(origin,target)
        originNode = node_at(origin[0],origin[1])
        targetNode = node_at(target[0],target[1])
        nodeFound = breadth_first_search(originNode,targetNode)
        totalMoves(nodeFound,originNode)
    end

    def totalMoves(node,origin)
        moves = []

        until node == origin
            moves.push([node.x,node.y])
            node = node.parentNode
        end
        moves.push([node.x,node.y])
        
        puts "You made it in #{moves.length-1} moves!  Heres your path:"
        moves.reverse.each {|coord| p coord}
        @allMoves.cellList.each {|node| node.parentNode = nil} # clean each node parent
    end

    def setParent(node)
        node.childList.each {|child| child.parentNode = node if child.parentNode.nil?} 
    end

    def breadth_first_search(origin,target)
        queue = [origin]

        until queue.empty?
            node = queue.shift

            if node.x == target.x && node.y == target.y
                return node
            else
                setParent(node)
                queue = queue + node.childList
            end   
        end
    end

end

knight = Knight.new
knight.KnightMoves([3,3],[4,3])
knight.KnightMoves([3,1],[3,5])
knight.KnightMoves([5,1],[1,5])
