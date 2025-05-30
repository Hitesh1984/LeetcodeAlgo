//
//  BalancedBT-110.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/28/25.

/*
 https://leetcode.com/problems/balanced-binary-tree/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a binary tree, determine if it is height-balanced.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: true
 Example 2:


 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 Example 3:

 Input: root = []
 Output: true
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104

 */

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    if !isBalanced(root.left) || !isBalanced(root.right) { return false }
    return abs(val(root.left) - val(root.right)) <= 1
}
private func val(_ tn: TreeNode?) -> Int {
    guard let node = tn else { return -1 }
    return 1 + max(val(node.left), val(node.right))
}
