//
//  Balance-A-BST-1381.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/24/25.
/*
 https://leetcode.com/problems/balance-a-binary-search-tree/description/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

 A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

  

 Example 1:


 Input: root = [1,null,2,null,3,null,4,null,null]
 Output: [2,1,3,null,null,null,4]
 Explanation: This is not the only correct answer, [3,1,4,null,2] is also correct.
 Example 2:


 Input: root = [2,1,3]
 Output: [2,1,3]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 1 <= Node.val <= 105
 */

func balanceBST(_ root: TreeNode?) -> TreeNode? {
    
    var inorder = [Int]()
    func dfs(_ node: TreeNode?) {
        guard let node else { return }
        dfs(node.left)
        inorder.append(node.val)
        dfs(node.right)
    }
    
    dfs(root)
    
    func createBalancedBST(_ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        let mid = start + (end-start)/2
        let left = createBalancedBST(start, mid-1)
        let right = createBalancedBST(mid+1, end)
        
        let node = TreeNode(inorder[mid], left, right)
        return node
    }
    
    return createBalancedBST(0, inorder.count - 1)
}
