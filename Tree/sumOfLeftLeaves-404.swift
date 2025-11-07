//
//  sumOfLeftLeaves-404.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/18/25.
/*
 https://leetcode.com/problems/sum-of-left-leaves/description/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of a binary tree, return the sum of all left leaves.

 A leaf is a node with no children. A left leaf is a leaf that is the left child of another node.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 24
 Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
 Example 2:

 Input: root = [1]
 Output: 0
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -1000 <= Node.val <= 1000
 */

final class Solution1233 {
    var leftSum = 0
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        leftSumfn(root, false)
        return leftSum
    }
    
    func leftSumfn(_ root: TreeNode?, _ isLeft: Bool) {
        if root == nil {
            return
        }
        if isLeft && root!.left == nil && root!.right == nil {
            leftSum += root!.val
        }
        leftSumfn(root!.left, true)
        leftSumfn(root!.right, false)
    }
}
