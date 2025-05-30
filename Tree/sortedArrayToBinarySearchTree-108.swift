//
//  sortedArrayToBinarySearchTree.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/4/25.
//

/*
 https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/
 
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

  

 Example 1:


 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:


 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
 */
import Foundation


//[-10,-3,0,5,9]



func convertArrayIntoBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        let mid = nums.count / 2
        let newNode = TreeNode(value: nums[mid])
        newNode.left = convertArrayIntoBinaryTree(Array(nums[0..<mid]))
        newNode.right = convertArrayIntoBinaryTree(Array(nums[mid+1..<nums.count]))
        return newNode
    }
/*
func convertArrayIntoBinaryTree(inputArray:[Int]) -> TreeNode? {
    if(inputArray.isEmpty) {
        return nil
    }
    return buildBinaryTree(inputArray, start: 0, end: inputArray.count-1)
}

func buildBinaryTree(_ nums:[Int], start:Int, end:Int) -> TreeNode?
{
    
    guard start <= end else  { return nil }
    if nums.isEmpty {
        return nil
    }
    if nums.count == 1 {
        return TreeNode(value: nums[0])
    }
    let mid = start + (end-start) / 2
    let binaryTree = TreeNode(value: nums[mid])
    binaryTree.left = buildBinaryTree(nums, start: start, end: mid-1)
    binaryTree.right = buildBinaryTree(nums, start: mid+1, end: end)
    return binaryTree
}
*/
/*
func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        helper(nums, 0, nums.count - 1)
}
private func helper(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        guard lo <= hi else { return nil }
        let mid = lo + (hi - lo) / 2
        let root = TreeNode(value: nums[mid])
        root.left = helper(nums, lo, mid - 1)
        root.right = helper(nums, mid + 1, hi)
        return root
}
*/
