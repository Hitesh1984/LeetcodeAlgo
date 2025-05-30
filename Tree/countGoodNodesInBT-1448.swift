//
//  countGoodNodesInBT-1448.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/29/25.

/*
 https://leetcode.com/problems/count-good-nodes-in-binary-tree/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a binary tree root, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.

 Return the number of good nodes in the binary tree.

  

 Example 1:



 Input: root = [3,1,4,3,null,1,5]
 Output: 4
 Explanation: Nodes in blue are good.
 Root Node (3) is always a good node.
 Node 4 -> (3,4) is the maximum value in the path starting from the root.
 Node 5 -> (3,4,5) is the maximum value in the path
 Node 3 -> (3,1,3) is the maximum value in the path.
 Example 2:



 Input: root = [3,3,null,4,2]
 Output: 3
 Explanation: Node 2 -> (3, 3, 2) is not good, because "3" is higher than it.
 Example 3:

 Input: root = [1]
 Output: 1
 Explanation: Root is considered as good.
  

 Constraints:

 The number of nodes in the binary tree is in the range [1, 10^5].
 Each node's value is between [-10^4, 10^4].

 */

func goodNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var result = 0
    var queue: [(TreeNode, Int)] = [(root, Int.min)]
    while !queue.isEmpty {
        let count = queue.count
        for i in 0..<count {
            let (node, prev) = queue.removeFirst()
            if node.val >= prev {
                result += 1
            }
            if let left = node.left {
                queue.append((left, max(prev,node.val)))
            }
            if let right = node.right {
                queue.append((right, max(prev,node.val)))
            }
        }
    }
    return result
}
