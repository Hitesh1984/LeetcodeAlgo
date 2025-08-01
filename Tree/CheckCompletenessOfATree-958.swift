//
//  CheckCompletenessOfATree-958.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/check-completeness-of-a-binary-tree/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the root of a binary tree, determine if it is a complete binary tree.

 In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

  

 Example 1:


 Input: root = [1,2,3,4,5,6]
 Output: true
 Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
 Example 2:


 Input: root = [1,2,3,4,5,null,7]
 Output: false
 Explanation: The node with value 7 isn't as far left as possible.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 100].
 1 <= Node.val <= 1000

 */

func isCompleteTree(_ root: TreeNode?) -> Bool {
    var queue: [TreeNode?] = [root]
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        if let first = first {
            queue.append(first.left)
            queue.append(first.right)
        } else {
            if queue.count > queue.filter { $0 == nil }.count {
                return false
            } else {
                return true
            }
        }
    }
    
    return true
}
