//
//  BinaryTreeZigzagLevelOrder-103.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/24/25.
//

import Foundation

/*
 
 https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/description/
 
 Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
 */

class zigZagSolution {

    struct Stack<T> {
    private var elements: [T] = []  // Array to hold stack elements
    
    // Push an element onto the stack
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // Pop an element from the stack (returns the element if available, nil if the stack is empty)
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    // Peek at the top element of the stack without removing it
    func peek() -> T? {
        return elements.last
    }
    
    // Check if the stack is empty
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    // Get the size of the stack
    func size() -> Int {
        return elements.count
    }
}

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {

        if root == nil {
            //var t:[[Int]] = []
            return []
        }
        return printBinaryTreeInZigZagOrder(root: root!)
    }
    public func printBinaryTreeInZigZagOrder(root:TreeNode) -> [[Int]]{
        var evenLevel:Stack<TreeNode> = Stack()
        var oddLevel:Stack<TreeNode> = Stack()
        var level = 1
        var results:[[Int]] = []
        evenLevel.push(root)
        while !(evenLevel.isEmpty()) || !(oddLevel.isEmpty()) {
            if level % 2 == 1 {
                var tempResult:[Int] = []
                while evenLevel.size() > 0 {
                    let elem = evenLevel.pop()!
                    if elem.left != nil {
                        oddLevel.push(elem.left!)
                    }
                    if elem.right != nil {
                        oddLevel.push(elem.right!)
                    }
                    tempResult.append(elem.val)
                }
                results.append(tempResult)
            } else {
                var tempResult:[Int] = []
                while oddLevel.size() > 0 {
                    let elem = oddLevel.pop()!
                    if elem.right != nil {
                        evenLevel.push(elem.right!)
                    }
                    if elem.left != nil {
                        evenLevel.push(elem.left!)
                    }
                    tempResult.append(elem.val)
                }
                results.append(tempResult)
            }
            level += 1
        }
        return results
    }
}

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    var firstQueue = [TreeNode]()
    var secondQueue = [TreeNode]()
    var levelCount = 1
    if let root = root {
        firstQueue.append(root)
    } else {
        return []
    }
    // [1,2,3,4,null,null,5]
    while !firstQueue.isEmpty || !secondQueue.isEmpty {
        if levelCount % 2 == 1 {
            var level:[Int] = []
            while !firstQueue.isEmpty {
                let tree = firstQueue.removeFirst() as! TreeNode
                level.append(tree.val)
                //if let left = tree.left {
                if tree.left != nil {
                    secondQueue.append(tree.left!)
                }
                //if let right = tree.right {
                if tree.right != nil {
                    secondQueue.append(tree.right!)
                }
            }
            if level.count > 0 {
                result.append(level)
            }
        } else {
            var level:[Int] = []
            while !secondQueue.isEmpty {
                let tree = secondQueue.removeFirst() as! TreeNode
                level.append(tree.val)
                //if let right = tree.right {
                if tree.right != nil {
                    firstQueue.append(tree.right!)
                }
                //if let left = tree.left {
                if tree.left != nil {
                    firstQueue.append(tree.left!)
                }
            }
            if level.count > 0 {
                result.append(level)
            }
        }
        levelCount += 1
    }
    return result
}


/*
class zigzagTraversal {
    
    var firstQueue = [TreeNode]()
    var secondQueue = [TreeNode]()
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if let root = root {
            firstQueue.append(root)
        } else {
            return []
        }
        
        while !firstQueue.isEmpty || secondQueue.isEmpty {
            var level = [Int]()
            while !firstQueue.isEmpty {
                let tree = firstQueue.removeFirst() as! TreeNode
                level.append(tree.val)
                if let left = tree.left {
                    secondQueue.append(left)
                }
                if let right = tree.right {
                    secondQueue.append(right)
                }
            }
            while !secondQueue.isEmpty {
                let tree = secondQueue.removeFirst() as! TreeNode
                level.append(tree.val)
                if let left = tree.left {
                    firstQueue.append(left)
                }
                if let right = tree.right {
                    firstQueue.append(right)
                }
            }
            
            if level.count > 0 {
                result.append(level)
            }
        }
        return result
    }
}

*/
