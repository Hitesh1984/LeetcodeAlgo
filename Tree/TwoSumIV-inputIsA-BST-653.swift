//
//  TwoSumIV-inputIsA-BST-653.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/15/25.
/*
 https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/?envType=problem-list-v2&envId=hash-table
 
 Given the root of a binary search tree and an integer k, return true if there exist two elements in the BST such that their sum is equal to k, or false otherwise.

  

 Example 1:


 Input: root = [5,3,6,2,4,null,7], k = 9
 Output: true
 Example 2:


 Input: root = [5,3,6,2,4,null,7], k = 28
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -104 <= Node.val <= 104
 root is guaranteed to be a valid binary search tree.
 -105 <= k <= 105

 */

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    var set = Set<Int>()      // create a set to store the values
    return find(root)          // call the helper function
    
    func find(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false } // if the root is nil, return false
        if set.contains(k - root.val) {             // if the set contains the difference between k and the root value, return true
            return true                             // because we found the pair
        }
        set.insert(root.val)                        // insert the root value into the set
        return find(root.left) || find(root.right) // call the helper function on the left and right subtrees
    }
}
