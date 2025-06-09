//
//  minStack-155.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/24/25.
//

/*
 https://leetcode.com/problems/min-stack/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months

 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 Implement the MinStack class:

 MinStack() initializes the stack object.
 void push(int val) pushes the element val onto the stack.
 void pop() removes the element on the top of the stack.
 int top() gets the top element of the stack.
 int getMin() retrieves the minimum element in the stack.
 You must implement a solution with O(1) time complexity for each function.

  

 Example 1:

 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]

 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
  

 Constraints:

 -231 <= val <= 231 - 1
 Methods pop, top and getMin operations will always be called on non-empty stacks.
 At most 3 * 104 calls will be made to push, pop, top, and getMin.
 
 */

class MinStack {
    var stack: [(element: Int, min: Int)] = []
    func push(_ x: Int) {
        if stack.count == 0 {
            stack.append((x, x))
        } else {
            stack.append((x, min(x, self.getMin()) ))
        }
    }
    func pop() {
        stack.popLast()
    }
    func top() -> Int {
        stack.last?.element ?? -1
    }
    func getMin() -> Int {
        stack.last?.min ?? -1
    }
}

/*
class MaxStack2 {
    var stack: [(element: Int, max: Int)] = []
    func push(_ x: Int) {
        if 0 == stack.count {
            stack.append((x,x))
        } else {
            stack.append((x, max(x, self.peekMax())))
        }
    }
    
    func pop() -> Int {
       let obj = stack.popLast()
        return obj?.element ?? -1
    }
    
    func top() -> Int {
        stack.last?.element ?? -1
    }
    
    func peekMax() -> Int {
        stack.last?.max ?? -1
    }
    
    func popMax() -> Int {
        let last = stack.removeLast()
        return last.max
    }
}
*/
