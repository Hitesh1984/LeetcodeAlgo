//
//  findDuplicates-652.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/29/25.

/*
 https://leetcode.com/problems/find-duplicate-subtrees/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given the root of a binary tree, return all duplicate subtrees.
 
 For each kind of duplicate subtrees, you only need to return the root node of any one of them.
 
 Two trees are duplicate if they have the same structure with the same node values.
 
 
 
 Example 1:
 
 
 Input: root = [1,2,3,4,null,2,4,null,null,4]
 Output: [[2,4],[4]]
 Example 2:
 
 
 Input: root = [2,1,1]
 Output: [[1]]
 Example 3:
 
 
 Input: root = [2,2,2,3,null,3,null]
 Output: [[2,3],[3]]
 
 
 Constraints:
 
 The number of the nodes in the tree will be in the range [1, 5000]
 -200 <= Node.val <= 200
 */

func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var result = [TreeNode?]()
    var map = [String: Int]() // map to keep track of the subtree frequency
    
    func traverse(_ node: TreeNode?) -> String {
        guard let node = node else {
            return "#" // null nodes are represented by #
        }
        let left = traverse(node.left)
        let right = traverse(node.right)
        let subtree = "\(node.val),\(left),\(right)"
        if let frequency = map[subtree], frequency == 1 {
            result.append(node)
        }
        map[subtree, default: 0] += 1
        return subtree
    }
    traverse(root)
    return result
}
