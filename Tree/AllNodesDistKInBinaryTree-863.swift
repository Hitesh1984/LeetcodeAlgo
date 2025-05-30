//
//  AllNodesDistKInBinaryTree-863.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/27/25.

/*
 https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.

 You can return the answer in any order.

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
 Output: [7,4,1]
 Explanation: The nodes that are a distance 2 from the target node (with value 5) have values 7, 4, and 1.
 Example 2:

 Input: root = [1], target = 1, k = 3
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [1, 500].
 0 <= Node.val <= 500
 All the values Node.val are unique.
 target is the value of one of the nodes in the tree.
 0 <= k <= 1000
 */

func testCases863() {
    
    let rt = TreeNode(left: TreeNode(value: 0), value: 1, right: TreeNode(value: 8) )
    let s2 = TreeNode(left: TreeNode(value: 7), value: 2, right: TreeNode(value: 4))
    let lt = TreeNode(left: TreeNode(value: 6), value:5 , right: s2 )
    let root = TreeNode(left: lt , value: 3, right:rt )
}

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    guard let root = root, let target = target else { return [] }
    var graph = [Int: [Int]]()
    
    func buildGraph(_ root: TreeNode? , _ parent: TreeNode?) {
        if let root = root, let parent = parent {
            graph[root.val, default: []].append(parent.val)
            graph[parent.val, default: []].append(root.val)
        }
        if let left = root?.left { buildGraph(left, root) }
        if let right = root?.right { buildGraph(right, root)}
    }
    buildGraph(root, nil)
    var result = [Int]()
    var visited = Set<Int>()
    visited.insert(target.val)
    
    func findDistanceKNodes(_ node: Int, _ distance: Int) {
        if distance == k {
            result.append(node)
            return
        }
        for neighborNode in graph[node, default: []] {
            if !visited.contains(neighborNode) {
                visited.insert(neighborNode)
                findDistanceKNodes(neighborNode, distance + 1)
            }
        }
    }
    findDistanceKNodes(target.val, 0)
    return result
}
