//
//  maxWidthOfBinaryTree-662.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/28/25.

/*
 https://leetcode.com/problems/maximum-width-of-binary-tree/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given the root of a binary tree, return the maximum width of the given tree.

 The maximum width of a tree is the maximum width among all levels.

 The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.

 It is guaranteed that the answer will in the range of a 32-bit signed integer.

  

 Example 1:


 Input: root = [1,3,2,5,3,null,9]
 Output: 4
 Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).
 Example 2:


 Input: root = [1,3,2,5,null,null,9,6,null,7]
 Output: 7
 Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).
 Example 3:


 Input: root = [1,3,2,5]
 Output: 2
 Explanation: The maximum width exists in the second level with length 2 (3,2).
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3000].
 -100 <= Node.val <= 100
 */

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var maxWidth = 0
    var queue: [(node: TreeNode, index: Int)] = [(root, 0)]
    while !queue.isEmpty {
        let levelSize = queue.count // 1 , 2
        let firstIndex = queue.first!.index // firstIndex = 0, 1
        let lastIndex = queue.last!.index // lastIndex = 0, 2
        maxWidth = max(maxWidth, lastIndex - firstIndex + 1)
        for i in 0..<levelSize {
            let (node, index) = queue.removeFirst() // node = 1 and index = 0, node = 3 and index = 1
            let normalisedIndex = index - firstIndex // 0 , 0 - 0 = 0
            if let left = node.left {
                queue.append((left, 2 * (normalisedIndex) + 1)) // queue = [(3, 1)], queue = [(2,2), (5,1)]
            }
            if let right = node.right {
                queue.append((right, 2 * (normalisedIndex) + 2))
            }
        }
    }
    return maxWidth
}
