//
//  BinaryTreeLevelOrderTraversal-102.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/22/25.
//

/*
 https://leetcode.com/problems/same-tree/description/
 
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

  

 Example 1:


 Input: p = [1,2,3], q = [1,2,3]
 Output: true
 Example 2:


 Input: p = [1,2], q = [1,null,2]
 Output: false
 Example 3:


 Input: p = [1,2,1], q = [1,1,2]
 Output: false
  

 Constraints:

 The number of nodes in both trees is in the range [0, 100].
 -104 <= Node.val <= 104

 */

func isBothSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
    
    if p == nil && q != nil {
        return false
    }else if p != nil && q == nil {
        return false
    }else if p == nil && q == nil {
        return true
    } else {
        return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    /*
    guard p != nil || q != nil else { return true }
    
    guard let p = p, let q = q else { return false }
    
    return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
     */
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p != nil || q != nil else { return true }
        
        guard let p = p, let q = q else { return false }
        
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}

import Foundation
