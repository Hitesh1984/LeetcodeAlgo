//
//  houseRobber3-337.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/29/25.
/*
 https://leetcode.com/problems/house-robber-iii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.

 Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

  

 Example 1:


 Input: root = [3,2,3,null,3,null,1]
 Output: 7
 Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
 Example 2:


 Input: root = [3,4,5,1,3,null,1]
 Output: 9
 Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 104

 */

import Foundation

func robTestCases() {
    let root = TreeNode(left: TreeNode(left: nil, value: 2, right: TreeNode(value: 3)), value: 3, right: TreeNode(left: nil, value: 3, right: TreeNode(value: 1)))
    let ret = rob(root)
}

func rob(_ root: TreeNode?) -> Int {
    func dfs(_ root: TreeNode?)->(withRoot:Int, withOutRoot:Int) {
        guard let node = root else { return (0,0) }
        
        let left = dfs(node.left)
        let right = dfs(node.right)
        
        let withRoot = node.val + left.withOutRoot + right.withOutRoot
        let withOutRoot = max(left.withRoot, left.withOutRoot) +
        max(right.withRoot, right.withOutRoot)
        return (withRoot, withOutRoot)
    }
    let result = dfs(root)
    print(result)
    return max(result.withRoot, result.withOutRoot)
}
