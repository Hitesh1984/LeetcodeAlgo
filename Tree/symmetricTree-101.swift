//
//  symmetricTree-101.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/22/25.
//
/*
 https://leetcode.com/problems/symmetric-tree/description/
 
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

  

 Example 1:


 Input: root = [1,2,2,3,4,4,3]
 Output: true
 Example 2:


 Input: root = [1,2,2,null,3,null,3]
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100
  

 Follow up: Could you solve it both recursively and iteratively?
 */
import Foundation

extension TreeNode : Equatable {
    public static func ==(lhs:TreeNode, rhs:TreeNode) -> Bool {
        return lhs.val == rhs.val &&
        lhs.left == rhs.right &&
        lhs.right == rhs.left
    }
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    return root?.left == root?.right
}
