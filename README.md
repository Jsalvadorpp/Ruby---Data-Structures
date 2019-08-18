# Ruby-Data-Structures

ruby projects made for: [The Odin Project](https://www.theodinproject.com/courses/ruby-programming)

### Assignment 1 - Structure of a Linked List

<div class="lesson-content__panel" markdown="1">
  You will need two classes:

  1. `LinkedList` class, which will represent the full list.
  2. `Node` class, containing a `#value` method and a link to the `#next_node`, set both as `nil` by default.


  Build the following methods in your linked list class:

  1. `#append` adds a new node to the end of the list
  2. `#prepend` adds a new node to the start of the list
  3. `#size` returns the total number of nodes in the list
  4. `#head` returns the first node in the list
  5. `#tail` returns the last node in the list
  6. `#at(index)` returns the node at the given index
  7. `#pop` removes the last element from the list
  8. `#contains?` returns true if the passed in value is in the list and otherwise returns false.
  9. `#find(data)` returns the index of the node containing data, or nil if not found.
  10. `#to_s` represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    The format should be: `( data ) -> ( data ) -> ( data ) -> nil`

  ### Extra Credit

  1. `#insert_at(index)` that inserts the node at the given index
  2. `#remove_at(index)` that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)
</div>


### Assignment 2 - Searching Binary Trees
You'll build a simple binary tree data structure from some arbitrary input and also the "crawler" function that will locate data inside of it.

<div class="lesson-content__panel" markdown="1">
  1. Build a class `Node`.  It should have a `value` that it stores and also links to its parent and children (if they exist).  Build getters and setters for it (e.g. parent node, child node(s)).
  2. Write a method `build_tree` which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of `Node` objects appropriately placed.  Start by assuming the array you get is sorted.
  3. Now refactor your `build_tree` to handle data that isn't presorted and cannot be easily sorted prior to building the tree.  You'll need to figure out how to add a node for each of the possible cases (e.g. if it's a leaf versus in the middle somewhere).
  3. Write a simple script that runs `build_tree` so you can test it out.
  5. Build a method `breadth_first_search` which takes a target value and returns the node at which it is located using the breadth first search technique.  If the target node value is not located, return `nil`.
  4. Build a method `depth_first_search` which returns the node at which the target value is located using the depth first search technique.  Use an array acting as a *stack* to do this.
  5. Next, build a new method `dfs_rec` which runs a depth first search as before but this time, instead of using a stack, make this method recursive.
</div>
  
 ### Assignment 3 - Knight's Travails
Your task is to build a function `knight_moves` that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates.  Your function would therefore look like:

  * `knight_moves([0,0],[1,2]) == [[0,0],[1,2]]`
  * `knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]`
  * `knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]`

<div class="lesson-content__panel" markdown="1">
1. Put together a script that creates a game board and a knight.
2. Treat all possible moves the knight could make as children in a tree.  Don't allow any moves to go off the board.
2. Decide which search algorithm is best to use for this case.  Hint: one of them could be a potentially infinite series.
3. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square.  Output what that full path looks like, e.g.:

~~~bash
  > knight_moves([3,3],[4,3])
  => You made it in 3 moves!  Heres your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
~~~
</div>
