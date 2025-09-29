//
//  maximumProductSubArray-152.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/11/25.
//

/*
 https://leetcode.com/problems/maximum-product-subarray/description/?envType=problem-list-v2&envId=dynamic-programming
 
 Given an integer array nums, find a subarray that has the largest product, and return the product.

 The test cases are generated so that the answer will fit in a 32-bit integer.

  

 Example 1:

 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:

 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -10 <= nums[i] <= 10
 The product of any subarray of nums is guaranteed to fit in a 32-bit integer.
 */

func maxProduct(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var ans = nums[0]
    var maxSoFar = nums[0]
    var minSoFar = nums[0]
    
    for i in 1..<nums.count {
        let curr = nums[i]
        
        let tmpMax = max(curr, maxSoFar * curr, minSoFar * curr)
        let tmpMin = min(curr, maxSoFar * curr, minSoFar * curr)
        minSoFar = tmpMin
        maxSoFar = tmpMax
        
        ans = max(ans, maxSoFar)
    }
    
    return ans
}
