//
//  constructBinaryTreeFromPreAndInOrder-105.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/30/25.
//
/*
 https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

  

 Example 1:


 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 Example 2:

 Input: preorder = [-1], inorder = [-1]
 Output: [-1]
  

 Constraints:

 1 <= preorder.length <= 3000
 inorder.length == preorder.length
 -3000 <= preorder[i], inorder[i] <= 3000
 preorder and inorder consist of unique values.
 Each value of inorder also appears in preorder.
 preorder is guaranteed to be the preorder traversal of the tree.
 inorder is guaranteed to be the inorder traversal of the tree.
 */

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0 && inorder.count > 0 else { return nil }
    let totalСount = preorder.count
    let root = TreeNode(value: preorder[0])
    var rootIndex = inorder.firstIndex(of: preorder[0]) ?? -1
    root.left = buildTree(Array(preorder[1..<1 + rootIndex]), Array(inorder[0..<rootIndex]))
    root.right = buildTree(Array(preorder[1 + rootIndex..<totalСount]), Array(inorder[1 + rootIndex..<totalСount]))
    
    return root
}
