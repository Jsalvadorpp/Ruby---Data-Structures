class Node

    attr_accessor :data, :nextNode
 
    def initialize
        @data = nil
        @nextNode = nil  
    end
end

class LinkedList

    attr_accessor :tail, :head, :size
 
    def initialize
        @tail = nil
        @head = nil
        @@size = 0      
    end

    def append(data)
        @@size += 1
        node = Node.new
        node.data = data

        if @head.nil? 
            @head = node 
            @tail = node 
        else
           @tail.nextNode = node
           @tail = node
        end
    end

    def prepend(data)
        @@size += 1
        node = Node.new
        node.data = data

       
        if @head.nil? 
            @head = node 
            @tail = node 
        else
           node.nextNode = @head
           @head = node
        end
    end

    def size
        return @@size
    end

    def head
        return @head.nil? ? nil : @head.data
    end

    def tail
        return @tail.nil? ? nil: @tail.data
    end

    def at(index,temp = @head)
        
        if index.between?(0,@@size-1)
            index.times { temp = temp.nextNode}
            return temp.data
        else
            return nil
        end
    end

    def pop(temp = @head)

        if @head.nil? 
            return nil
        else
            if @head == @tail
                @tail = nil
                @head = nil
                @@size -= 1
            else
                while temp.nextNode != @tail
                    temp = temp.nextNode
                end
                    temp.nextNode = nil
                    @tail = temp
                    @@size -= 1
            end
        end
    end

    def contains?(data, temp = @head,contain = false)
        contain = true if temp.data == data

        while temp.nextNode != nil
            temp = temp.nextNode
            contain = true if temp.data == data
        end
        return contain
    end

    def find(data,temp = @head,index = 0)
        return nil unless self.contains?(data) #data not found , returns nil

        until temp.data == data
            index += 1 
            temp = temp.nextNode
        end 
        return index
    end

    def to_s
        temp = @head
        string = ""
        return "nil" if temp.nil?

        until temp.nextNode.nil?
            string += "( #{temp.data} ) -> "
            temp = temp.nextNode
        end

        return string += "( #{temp.data} ) -> nil"
    end

    def insert_at(data,index)
        temp = @head
        temp2 = @head
        node = Node.new
        node.data = data
       
        if index.between?(1,@@size-1)
            index.times { temp = temp.nextNode}
            node.nextNode = temp

            until temp2.nextNode == temp
                temp2 = temp2.nextNode
            end

            temp2.nextNode = node
            @@size += 1  
        elsif index == 0 
            self.prepend(data)    
        else
            return nil
        end
        
    end

    def remove_at(index)
        temp = @head
        temp2 = @head
    
        if index.between?(1,@@size-1)
            index.times { temp = temp.nextNode}

            until temp2.nextNode == temp
                temp2 = temp2.nextNode
            end
            temp2.nextNode = temp.nextNode
            temp = nil
            @@size -= 1
     
        elsif index == 0 
            @head = @head.nextNode
            @@size -= 1
        else
            return nil
        end
        
    end

end

list = LinkedList.new
list.append("31")
list.prepend("51")
list.append("4")
list.append("2")

puts list

list.remove_at(3)
#list.insert_at("8",3)
puts list

