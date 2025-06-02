//
//  subArraySumEqualsK.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/21/25.
/*
 https://leetcode.com/problems/subarray-sum-equals-k/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.

 A subarray is a contiguous non-empty sequence of elements within an array.

  

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107

 */

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var map:[Int:Int] = [0:1]
    var count = 0
    var sum = 0
    for num in nums {
        sum += num
        if let occurances = map[k-sum] {
            count += occurances
        }
        map[sum, default: 0] += 1
    }
    return count
}
