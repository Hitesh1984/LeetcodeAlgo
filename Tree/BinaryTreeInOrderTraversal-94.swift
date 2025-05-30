//
//  BinaryTreeInOrderTraversal-94.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/22/25.
//

/*
 https://leetcode.com/problems/binary-tree-inorder-traversal/description/
 
 Given the root of a binary tree, return the inorder traversal of its nodes' values.

  

 Example 1:

 Input: root = [1,null,2,3]

 Output: [1,3,2]

 Explanation:



 Example 2:

 Input: root = [1,2,3,4,5,null,8,null,null,6,7,9]

 Output: [4,2,6,5,7,1,3,9,8]

 Explanation:



 Example 3:

 Input: root = []

 Output: []

 Example 4:

 Input: root = [1]

 Output: [1]

  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 */

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        var stack = [TreeNode?]()
        var curr = root

        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            curr = stack.removeLast()
            if let val = curr?.val {
                ans.append(val)
            }
            curr = curr?.right
        }
        return ans
}
