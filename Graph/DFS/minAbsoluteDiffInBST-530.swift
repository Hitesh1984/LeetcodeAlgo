//
//  minAbsoluteDiffInBST-530.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/22/25.
//
/*
 https://leetcode.com/problems/minimum-absolute-difference-in-bst/description/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.

  

 Example 1:


 Input: root = [4,2,6,1,3]
 Output: 1
 Example 2:


 Input: root = [1,0,48,null,null,12,49]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [2, 104].
 0 <= Node.val <= 105
 */

func getMinimumDifference(_ root: TreeNode?) -> Int {
    var difference = Int.max
    var previousNodeValue: Int?
    inOrderTraversal(root)
    return difference
    
    func inOrderTraversal(_ node: TreeNode?) {
        guard let currentNode = node else {
            return
        }
        inOrderTraversal(currentNode.left)
        if let value = previousNodeValue {
            difference = min(difference, abs(currentNode.val - value))
        }
        previousNodeValue = currentNode.val
        inOrderTraversal(currentNode.right)
    }
}
