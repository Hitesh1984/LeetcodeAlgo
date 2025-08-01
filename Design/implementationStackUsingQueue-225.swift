//
//  implementationStackUsingQueue-225.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/13/25.
/*
 https://leetcode.com/problems/implement-stack-using-queues/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).

 Implement the MyStack class:

 void push(int x) Pushes element x to the top of the stack.
 int pop() Removes the element on the top of the stack and returns it.
 int top() Returns the element on the top of the stack.
 boolean empty() Returns true if the stack is empty, false otherwise.
 Notes:

 You must use only standard operations of a queue, which means that only push to back, peek/pop from front, size and is empty operations are valid.
 Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.
  

 Example 1:

 Input
 ["MyStack", "push", "push", "top", "pop", "empty"]
 [[], [1], [2], [], [], []]
 Output
 [null, null, null, 2, 2, false]

 Explanation
 MyStack myStack = new MyStack();
 myStack.push(1);
 myStack.push(2);
 myStack.top(); // return 2
 myStack.pop(); // return 2
 myStack.empty(); // return False
  

 Constraints:

 1 <= x <= 9
 At most 100 calls will be made to push, pop, top, and empty.
 All the calls to pop and top are valid.
  
 
 
 */

class Queue2 {
    private var store = [Int]() // keep private to enforce queue semantics
    var size:Int { store.count }
    func add(_ x:Int) { store.append(x) }
    func remove() -> Int { store.remove(at: 0) }
}
class MyStack {
    var queue = Queue2()
    var topValue = 0
    
    func push(_ x: Int) {
        queue.add(x)
        topValue = x
    }
    
    func pop() -> Int {
        var backupQueue = Queue2()
        let result = topValue
        while queue.size > 1 {
            topValue = queue.remove()
            backupQueue.add(topValue)
        }
        queue = backupQueue
        return result
    }
    
    func top() -> Int { topValue }
    func empty() -> Bool { queue.size == 0 }
}
