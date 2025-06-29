//
//  pathSum-2-113.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/25/25.
/*
 https://leetcode.com/problems/path-sum-ii/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.

 A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

  

 Example 1:


 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: [[5,4,11,2],[5,8,4,5]]
 Explanation: There are two paths whose sum equals targetSum:
 5 + 4 + 11 + 2 = 22
 5 + 8 + 4 + 5 = 22
 Example 2:


 Input: root = [1,2,3], targetSum = 5
 Output: []
 Example 3:

 Input: root = [1,2], targetSum = 0
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
 
 */

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var ans = [[Int]]()
    
    func dfs(_ node: TreeNode?, _ sum: Int, _ nodes: [Int]) {
        guard let node else { return }
        if node.left == nil && node.right == nil && sum + node.val == targetSum  {
            ans.append(nodes + [node.val])
            return
        }
        dfs(node.left, sum + node.val, nodes + [node.val])
        dfs(node.right, sum + node.val, nodes + [node.val])
    }
    
    dfs(root, 0, [])
    return ans
}


