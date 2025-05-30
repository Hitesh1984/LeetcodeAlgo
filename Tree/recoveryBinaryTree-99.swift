//
//  recoveryBinaryTree-99.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/23/25.
//

/*
 
 https://leetcode.com/problems/recover-binary-search-tree/description/
 
 You are given the root of a binary search tree (BST), where the values of exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.

  

 Example 1:


 Input: root = [1,3,null,null,2]
 Output: [3,1,null,null,2]
 Explanation: 3 cannot be a left child of 1 because 3 > 1. Swapping 1 and 3 makes the BST valid.
 Example 2:


 Input: root = [3,1,4,null,null,2]
 Output: [2,1,4,null,null,3]
 Explanation: 2 cannot be in the right subtree of 3 because 2 < 3. Swapping 2 and 3 makes the BST valid.
  

 Constraints:

 The number of nodes in the tree is in the range [2, 1000].
 -231 <= Node.val <= 231 - 1
  

 Follow up: A solution using O(n) space is pretty straight-forward. Could you devise a constant O(1) space solution?
 
 */
import Foundation

    func recoverTree(_ root: TreeNode?) {
        var lhs: TreeNode?, rhs: TreeNode?, prev: TreeNode?
        func bfs(_ root: TreeNode?) {
            guard let node = root else { return }
            bfs(node.left)
            if lhs == nil, let prev = prev, prev.val > node.val { lhs = prev }
            if lhs != nil, rhs == nil || node.val < rhs!.val { rhs = node }
            prev = node
            bfs(node.right)
        }
        bfs(root)
        if let lhs = lhs, let rhs = rhs {
            let tmp = lhs.val
            lhs.val = rhs.val
            rhs.val = tmp
        }
    }
