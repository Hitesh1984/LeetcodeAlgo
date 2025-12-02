//
//  countUniValueSubTrees-250.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/13/25.
/*
 https://leetcode.com/problems/count-univalue-subtrees/description/?envType=problem-list-v2&envId=depth-first-search
 
 250. Count Univalue Subtrees
 Solved
 Medium

 Topics
 conpanies icon
 Companies
 Given the root of a binary tree, return the number of uni-value subtrees.

 A uni-value subtree means all nodes of the subtree have the same value.

  

 Example 1:


 Input: root = [5,1,5,5,5,null,5]
 Output: 4
 Example 2:

 Input: root = []
 Output: 0
 Example 3:

 Input: root = [5,5,5,5,5,null,5]
 Output: 6
  

 Constraints:

 The number of the node in the tree will be in the range [0, 1000].
 -1000 <= Node.val <= 1000
 */

func countUnivalSubtrees(_ root: TreeNode?) -> Int {
    var count = 0
    _ = isValid(root)
    return count
    
    func isValid(_ node: TreeNode?) -> Bool {
        guard let node = node else { return true }
        let leftRes = isValid(node.left)
        let rightRes = isValid(node.right)
        if let left = node.left, left.val != node.val {
            return false
        }
        if let right = node.right, right.val != node.val {
            return false
        }
        if leftRes, rightRes {
            count += 1
        }
        return leftRes && rightRes
    }
}
