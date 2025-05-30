//
//  subTreeOfAnotherTree-573.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/30/25.
/*
 https://leetcode.com/problems/subtree-of-another-tree/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

 A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

  

 Example 1:


 Input: root = [3,4,5,1,2], subRoot = [4,1,2]
 Output: true
 Example 2:


 Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
 Output: false
  

 Constraints:

 The number of nodes in the root tree is in the range [1, 2000].
 The number of nodes in the subRoot tree is in the range [1, 1000].
 -104 <= root.val <= 104
 -104 <= subRoot.val <= 104
 */




/*
extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
}
 */

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    guard let root else {
        return false
    }
    if root == subRoot {
        return true
    }
    
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
}


