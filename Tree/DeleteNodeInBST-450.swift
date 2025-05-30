//
//  DeleteNodeInBST-450.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/28/25.
//
/*
 https://leetcode.com/problems/delete-node-in-a-bst/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.
  

 Example 1:


 Input: root = [5,3,6,2,4,null,7], key = 3
 Output: [5,4,6,2,null,null,7]
 Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
 One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
 Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.

 Example 2:

 Input: root = [5,3,6,2,4,null,7], key = 0
 Output: [5,3,6,2,4,null,7]
 Explanation: The tree does not contain a node with value = 0.
 Example 3:

 Input: root = [], key = 0
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -105 <= Node.val <= 105
 Each node has a unique value.
 root is a valid binary search tree.
 -105 <= key <= 105
 */

func testCasesDeleteNode() {
    let s1 = TreeNode(left: TreeNode(value: 13), value: 14, right: nil )
    let rt = TreeNode(left: nil, value: 10, right: s1 )
    let s2 = TreeNode(left: TreeNode(value: 4), value: 6, right:TreeNode(value: 7) )
    let lt = TreeNode(left: TreeNode(value: 1), value: 3, right: s2 )
    
    let root = TreeNode(left: lt , value: 8, right:rt )
    print(root.description)
    let res = deleteNode(root, 3)
}


func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    if key < root.val {
        root.left = deleteNode(root.left, key)
    } else if key > root.val {
        root.right = deleteNode(root.right, key)
    } else {
        if root.left == nil {
            return root.right
        } else if root.right == nil {
            return root.left
        }
        var minNode = root.right
        while let next = minNode?.left  {
            minNode = next
        }
        root.val = minNode!.val
        root.right = deleteNode(root.right, root.val)
    }
    return root
}
