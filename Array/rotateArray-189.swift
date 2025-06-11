//
//  rotateArray-189.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.
/*
 https://leetcode.com/problems/rotate-array/description/?envType=company&envId=amazon&favoriteSlug=amazon-six-months
 
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

  

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
  

 Constraints:

 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
  

 Follow up:

 Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
 */

func rotate(_ nums: inout [Int], _ k: Int) {
    guard !nums.isEmpty ||  k > 0  else { return }
    
    //pointers
    let n = nums.count
    var k = k
    if k > n {
        k = k % n
    }
    // Reverse entire array
    nums.reverse() // 7,6,5,4,3,2,1
    
    // Reverse first k elements
    nums[0..<k].reverse() // 5,6,7,4,3,2,1
    
    // Reverse remaining n-k elements
    nums[k..<n].reverse() // 5,6,7, 1,2,3,4
}
