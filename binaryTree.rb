class Node
    attr_accessor :data , :parentNode
    attr_accessor :leftChild, :rightChild

    def initialize(data)
        @data = data
        @leftChild = nil
        @rightChild = nil
        @parentNode = nil
    end
end

class BinaryTree
    
    def initialize(dataArray)
        @root = Node.new(dataArray[0])
        buildTree(dataArray[1..-1])
    end

    def buildTree(dataArray)
        dataArray.each { |data| addChild(@root,Node.new(data))}  
    end

    def addChild(parent,node)

        if node.data < parent.data
    
            if parent.leftChild.nil?
                parent.leftChild = node
                node.parentNode = parent
            else
                addChild(parent.leftChild,node)
            end
    
        elsif node.data > parent.data
    
            if parent.rightChild.nil?
                parent.rightChild = node
                node.parentNode = parent
            else
                addChild(parent.rightChild,node)
            end
        end
    end

    def breadth_first_search(target)
        queue = [@root]

        until queue.empty?
            
            node = queue.shift
    
            if node.data == target
                return node
            else
                queue.push(node.leftChild) unless node.leftChild.nil?
                queue.push(node.rightChild) unless node.rightChild.nil?
            end   
        end

        return nil
    end

    def depth_first_search(target)
        stack = [@root]

        until stack.empty?

            node = stack.pop()
            return node if node.data == target
            stack.push(node.rightChild) unless node.rightChild.nil?
            stack.push(node.leftChild) unless node.leftChild.nil?
        end

        return nil
    end

    def dfs_rec(target,node = @root)
        
        return node if target == node.data
        dfs_rec(target,node.leftChild) unless node.leftChild.nil?
        dfs_rec(target,node.rightChild) unless node.rightChild.nil?
    end

    def displayTree
        puts "              #{@root.data}"
        puts "            /     \\"
        puts "          #{@root.leftChild.data}        #{@root.rightChild.data}"
        puts "        /   \\     /   \\"
        puts "       #{@root.leftChild.leftChild.data}     #{@root.leftChild.rightChild.data}   #{@root.rightChild.leftChild.data}     #{@root.rightChild.rightChild.data}"
        puts "              \\"
        puts "               #{@root.leftChild.rightChild.rightChild.data}"
    end

end

tree = BinaryTree.new([10,5,20,6,50,15,4,7])
tree.dfs_rec(201)
#tree.depth_first_search(50)
#tree.breadth_first_search(6)
#tree.displayTree()




