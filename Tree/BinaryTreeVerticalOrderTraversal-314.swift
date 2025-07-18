//
//  BinaryTreeVerticalOrderTraversal-314.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/17/25.

/*
 https://leetcode.com/problems/binary-tree-vertical-order-traversal/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the root of a binary tree, return the vertical order traversal of its nodes' values. (i.e., from top to bottom, column by column).

 If two nodes are in the same row and column, the order should be from left to right.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[9],[3,15],[20],[7]]
 Example 2:


 Input: root = [3,9,8,4,0,1,7]
 Output: [[4],[9],[3,0,1],[8],[7]]
 Example 3:


 Input: root = [1,2,3,4,10,9,11,null,5,null,null,null,null,null,null,null,6]
 Output: [[4],[2,5],[1,10,9,6],[3],[11]]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 */

func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var res = [[Int]]()
    var columns = [Int: [Int]]()
    var q = [(0, root)]
    var minX = Int.max
    var maxX = Int.min
    while !q.isEmpty {
        let (x, node) = q.removeFirst()
        columns[x, default: []].append(node.val)
        minX = min(minX, x)
        maxX = max(maxX, x)
        if node.left != nil { q.append((x - 1, node.left!)) }
        if node.right != nil { q.append((x + 1, node.right!))}
    }
    for level in minX...maxX {
        res.append(columns[level]!)
    }
    columns.removeAll()
    return res
}

