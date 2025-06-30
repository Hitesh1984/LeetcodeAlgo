//
//  minDepthOfBinaryTree-111.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/18/25.

/*
 https://leetcode.com/problems/minimum-depth-of-binary-tree/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 Example 2:

 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5
  

 Constraints:

 The number of nodes in the tree is in the range [0, 105].
 -1000 <= Node.val <= 1000

 */

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root  else { return 0 }
    if let left = root.left, let right = root.right {
        return min( minDepth(left), minDepth(right) ) + 1
    } else if let left = root.left {
        return minDepth(left) + 1
    }
    return minDepth(root.right) + 1
}
