//
//  lowestCommonAncestorBT-3-1650.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/30/25.

/*
 https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).

 Each node will have a reference to its parent node. The definition for Node is below:

 class Node {
     public int val;
     public Node left;
     public Node right;
     public Node parent;
 }
 According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes p and q in a tree T is the lowest node that has both p and q as descendants (where we allow a node to be a descendant of itself)."

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 Example 2:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5 since a node can be a descendant of itself according to the LCA definition.
 Example 3:

 Input: root = [1,2], p = 1, q = 2
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [2, 105].
 -109 <= Node.val <= 109
 All Node.val are unique.
 p != q
 p and q exist in the tree.

 */
public class NodeNew {
    public var val: Int
    public var left: NodeNew?
    public var right: NodeNew?
    public var parent: NodeNew?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

func lowestCommonAncestor(_ p: NodeNew?,_ q: NodeNew?) -> NodeNew? {
    guard p !== q else { return q }
    var node1 = p
    var node2 = q
    while node1?.parent != nil || node2?.parent != nil {
        node1 = node1?.parent ?? q
        node2 = node2?.parent ?? p
        if node1 === node2 {
            return node1
        }
    }
    return nil
}
