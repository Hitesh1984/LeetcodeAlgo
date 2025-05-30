//
//  BinaryTreeRightSideView-199.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/28/25.

/*
 https://leetcode.com/problems/binary-tree-right-side-view/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

  

 Example 1:

 Input: root = [1,2,3,null,5,null,4]

 Output: [1,3,4]

 Explanation:



 Example 2:

 Input: root = [1,2,3,4,null,null,null,5]

 Output: [1,3,4,5]

 Explanation:



 Example 3:

 Input: root = [1,null,3]

 Output: [1,3]

 Example 4:

 Input: root = []

 Output: []

  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 */

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var res = [Int]()
    var queue = [TreeNode]()
    queue.append(root)
    while !queue.isEmpty {
        res.append(queue.last!.val)
        let count = queue.count
        for i in 0..<count {
            let node = queue.removeFirst()
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    return res
}
