//
//  validateBinarySearchTree98.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/22/25.
//

/*
 https://leetcode.com/problems/validate-binary-search-tree/description/
 
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:


 Input: root = [2,1,3]
 Output: true
 Example 2:


 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
 */

import Foundation

class validBST {
    private var prev: Int?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        inorder(root)
    }
    
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        guard inorder(root.left) else { return false }
        
        if let prev = prev, root.val <= prev { return false }
        
        prev = root.val
        return inorder(root.right)
        
    }
}


class validTree {
    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.

    private var prev: Int?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        inorder(root)
    }
    
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        guard inorder(root.left) else { return false }
        
        if let prev = prev, root.val <= prev { return false }
        
        prev = root.val
        return inorder(root.right)
    }

}
