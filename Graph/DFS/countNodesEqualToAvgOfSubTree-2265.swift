//
//  countNodesEqualToAvgOfSubTree-2265.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/28/25.
/*
 https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the root of a binary tree, return the number of nodes where the value of the node is equal to the average of the values in its subtree.

 Note:

 The average of n elements is the sum of the n elements divided by n and rounded down to the nearest integer.
 A subtree of root is a tree consisting of root and all of its descendants.
  

 Example 1:


 Input: root = [4,8,5,0,1,null,6]
 Output: 5
 Explanation:
 For the node with value 4: The average of its subtree is (4 + 8 + 5 + 0 + 1 + 6) / 6 = 24 / 6 = 4.
 For the node with value 5: The average of its subtree is (5 + 6) / 2 = 11 / 2 = 5.
 For the node with value 0: The average of its subtree is 0 / 1 = 0.
 For the node with value 1: The average of its subtree is 1 / 1 = 1.
 For the node with value 6: The average of its subtree is 6 / 1 = 6.
 Example 2:


 Input: root = [1]
 Output: 1
 Explanation: For the node with value 1: The average of its subtree is 1 / 1 = 1.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 0 <= Node.val <= 1000

*/

func averageOfSubtree(_ root: TreeNode?) -> Int {
    var result = 0
    postOrder(root, &result)
    return result
    
    
    func postOrder(_ root: TreeNode?, _ result : inout Int) -> (Int, Int) {
        guard let root = root else { return (0, 0)}
        
        let left = postOrder(root.left, &result)
        let right = postOrder(root.right, &result)
        
        let sum = left.0 + right.0 + root.val
        let count = left.1 + right.1 + 1
        if sum/count == root.val {
            result += 1
        }
        return (sum,count)
    }
}
