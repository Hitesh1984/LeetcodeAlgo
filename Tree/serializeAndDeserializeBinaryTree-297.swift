//
//  serializeAndDeserializeBinaryTree.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/13/25.
//

import Foundation


/*
 https://leetcode.com/problems/serialize-and-deserialize-binary-tree/description/
 
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

  

 Example 1:


 Input: root = [1,2,3,null,null,4,5]
 Output: [1,2,3,null,null,4,5]
 Example 2:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -1000 <= Node.val <= 1000
 
 */

func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return "null,"
        }
        let newNode = "\(root?.val ?? 0)," + serialize(root?.left) + serialize(root?.right)
        return newNode
    }
    
    private func deserialize(_ queue: inout [String]) -> TreeNode? {
        let value = queue.removeFirst()
        if value == "null" {
            return nil
        }
        let node = TreeNode(value: Int(value) ?? 0)
        node.left = deserialize(&queue)
        node.right = deserialize(&queue)
        return node
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var queue: [String] = data.components(separatedBy: ",")
        return deserialize(&queue)
    }
