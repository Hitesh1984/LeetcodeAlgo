//
//  findModeInBST-501.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/19/25.
//

/*
 https://leetcode.com/problems/find-mode-in-binary-search-tree/description/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.

 If the tree has more than one mode, return them in any order.

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than or equal to the node's key.
 The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:


 Input: root = [1,null,2,2]
 Output: [2]
 Example 2:

 Input: root = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
  
 */

func findMode(_ root: TreeNode?) -> [Int] {
    guard let r = root else { return [] }
    
    var dict = [Int:Int]()
    var queues = [r]
    var maximum = 0
    
    while !queues.isEmpty {
        let queue = queues.removeFirst()
        
        dict[queue.val, default: 0] += 1
        maximum = max(maximum, dict[queue.val]!)
        
        if let l = queue.left {
            queues.append(l)
        }
        if let r = queue.right {
            queues.append(r)
        }
    }
    
    return Array(dict.filter { $0.value == maximum }.keys)
}
