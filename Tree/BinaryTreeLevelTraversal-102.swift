//
//  BinaryTreeLevelTraversal.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/3/25.
//

import Foundation

/*
 
 https://leetcode.com/problems/binary-tree-level-order-traversal/submissions/1615126518/
 
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000

 
 */

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    var treeQueue = [TreeNode]()
    if let root = root {
        treeQueue.append(root)
    } else {
        return []
    }
    while !treeQueue.isEmpty {
        let treeLength = treeQueue.count
        var level = [Int]()
        for _ in Range(0...treeLength-1) {
            let tree = treeQueue.removeFirst() as! TreeNode
            level.append(tree.val)
            if let left = tree.left {
                treeQueue.append(left)
            }
            if let right = tree.right {
                treeQueue.append(right)
            }
        }
        if level.count > 0 {
            result.append(level)
        }
    }
    return result
}

/*
 class Solution {
     // 1. dfs or bfs? bfs
     // flatten subnodes of nodes at the same level
     func levelOrder(_ root: TreeNode?) -> [[Int]] {
         guard let root = root else { return [] }
         
         var result: [[Int]] = [[root.val]]
         var newNodes: [TreeNode] = [root]
         
         while(true) {
             newNodes = getSubnodes(of: newNodes)
             guard newNodes.isEmpty == false else { return result }
             
             let newValues = newNodes.map { $0.val }
             result.append(newValues)
         }
         
         return result
     }
     
     func getSubnodes(of nodes: [TreeNode]) -> [TreeNode] {
         
         let flattenedSubnodes = nodes.flatMap { [$0.left, $0.right] }.compactMap{$0}
         // print(flattenedSubnodes)
         
         return flattenedSubnodes
     }
 }
 */

func binaryTreeLevelTraversal(root:BinaryTree<Int>) -> [[Int]] {
    
    var result = [[Int]]()
    var treeQueue = [BinaryTree<Int>]()
    treeQueue.append(root)
    
    while !treeQueue.isEmpty {
        let treeLength = treeQueue.count
        var level = [Int]()
        for _ in Range(0...treeLength-1) {
            let tree = treeQueue.removeFirst() as! BinaryTree<Int>
            switch tree {
            case .empty:
                continue
            case let .node(left, value, right):
                level.append(value)
                treeQueue.append(left)
                treeQueue.append(right)
            }
        }
        if level.count > 0 {
            result.append(level)
        }
    }
    return result
}

