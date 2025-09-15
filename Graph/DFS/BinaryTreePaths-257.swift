//
//  BinaryTreePaths-257.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/15/25.
/*
 https://leetcode.com/problems/binary-tree-paths/description/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of a binary tree, return all root-to-leaf paths in any order.

 A leaf is a node with no children.

  

 Example 1:


 Input: root = [1,2,3,null,5]
 Output: ["1->2->5","1->3"]
 Example 2:

 Input: root = [1]
 Output: ["1"]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 100].
 -100 <= Node.val <= 100
 */

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else {
        return []
    }
    if root.left == nil && root.right == nil {
        return ["\(root.val)"]
    }
    return (binaryTreePaths(root.left) + binaryTreePaths(root.right))
        .map { "\(root.val)->" + $0 }
}
