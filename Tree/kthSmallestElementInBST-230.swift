//
//  kthSmallestElementInBST-230.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/28/25.

/*
 https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

  

 Example 1:


 Input: root = [3,1,4,null,2], k = 1
 Output: 1
 Example 2:


 Input: root = [5,3,6,2,4,null,null,1], k = 3
 Output: 3
  

 Constraints:

 The number of nodes in the tree is n.
 1 <= k <= n <= 104
 0 <= Node.val <= 104
 */

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var count = 0
    var result = -1
    func dfs(_ node:TreeNode?) {
        guard let node else { return }
        if let left = node.left { dfs(left) }
        guard count < k else { return }
        result = node.val
        count += 1
        guard count < k else { return }
        if let right = node.right { dfs(right) }
    }
    dfs(root)
    return result
}
