//
//  isXandyCousinsOfBinaryTree.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/13/25.
//

import Foundation

/*
 https://leetcode.com/problems/cousins-in-binary-tree/description/
 
 Given the root of a binary tree with unique values and the values of two different nodes of the tree x and y, return true if the nodes corresponding to the values x and y in the tree are cousins, or false otherwise.

 Two nodes of a binary tree are cousins if they have the same depth with different parents.

 Note that in a binary tree, the root node is at the depth 0, and children of each depth k node are at the depth k + 1.
 
 Example 1:


 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 Example 2:


 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 Example 3:


 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [2, 100].
 1 <= Node.val <= 100
 Each node has a unique value.
 x != y
 x and y are exist in the tree.
 */

func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    var xLevel = -1
    var xParent = -1
    var yLevel = -1
    var yParent = -1
    func dfs(_ node: TreeNode?, _ level: Int, _ parentVal: Int, _ target: Int) {
        guard let node = node else { return }
        if node.val == target {
            if target == x {
                xLevel = level
                xParent = parentVal
            } else {
                yLevel = level
                yParent = parentVal
            }
            return
        }
        dfs(node.left, level+1, node.val, target)
        dfs(node.right, level+1, node.val, target)
    }
    
    dfs(root, 0, -1, x)
    dfs(root, 0, -1, y)
    return xLevel != -1 && xLevel == yLevel && xParent != yParent
}
