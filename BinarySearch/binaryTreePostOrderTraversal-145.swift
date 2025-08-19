//
//  binaryTreePostOrderTraversal-145.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/13/25.
/*
 https://leetcode.com/problems/binary-tree-postorder-traversal/description/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of a binary tree, return the postorder traversal of its nodes' values.

  

 Example 1:

 Input: root = [1,null,2,3]

 Output: [3,2,1]

 Explanation:



 Example 2:

 Input: root = [1,2,3,4,5,null,8,null,null,6,7,9]

 Output: [4,6,7,5,2,9,8,3,1]

 Explanation:



 Example 3:

 Input: root = []

 Output: []

 Example 4:

 Input: root = [1]

 Output: [1]

  

 Constraints:

 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 */

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    func postOrder(_ root:TreeNode?) {
        guard let root = root else { return }
        postOrder(root.left)
        postOrder(root.right)
        res.append(root.val)
    }
    postOrder(root)
    return res
}
