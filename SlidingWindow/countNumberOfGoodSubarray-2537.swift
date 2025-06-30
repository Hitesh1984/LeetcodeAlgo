//
//  countNumberOfGoodSubarray-2537.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/27/25.
/*
 https://leetcode.com/problems/count-the-number-of-good-subarrays/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer array nums and an integer k, return the number of good subarrays of nums.

 A subarray arr is good if there are at least k pairs of indices (i, j) such that i < j and arr[i] == arr[j].

 A subarray is a contiguous non-empty sequence of elements within an array.

  

 Example 1:

 Input: nums = [1,1,1,1,1], k = 10
 Output: 1
 Explanation: The only good subarray is the array nums itself.
 Example 2:

 Input: nums = [3,1,4,3,2,2,4], k = 2
 Output: 4
 Explanation: There are 4 different good subarrays:
 - [3,1,4,3,2,2] that has 2 pairs.
 - [3,1,4,3,2,2,4] that has 3 pairs.
 - [1,4,3,2,2,4] that has 2 pairs.
 - [4,3,2,2,4] that has 2 pairs.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i], k <= 109

 */

func countGood(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var frequencies: [Int: Int] = [:]
    var (L, R) = (0, 0)
    var pairs = 0
    
    while L < nums.count {
        while R < nums.count && pairs < k {
            frequencies[nums[R], default: 0] += 1
            pairs += frequencies[nums[R]]! - 1
            R += 1
        }
        if pairs >= k {
            result += nums.count - R + 1 // 5
        }
        frequencies[nums[L]]! -= 1
        pairs -= frequencies[nums[L]]!
        L += 1
        if pairs < k && R == nums.count {
            break
        }
    }
    return result
}
