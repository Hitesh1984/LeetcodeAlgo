//
//  maximumGap-164.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/16/25.
/*
 https://leetcode.com/problems/maximum-gap/?envType=problem-list-v2&envId=array
 
 Given an integer array nums, return the maximum difference between two successive elements in its sorted form. If the array contains less than two elements, return 0.

 You must write an algorithm that runs in linear time and uses linear extra space.

  

 Example 1:

 Input: nums = [3,6,9,1]
 Output: 3
 Explanation: The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.
 Example 2:

 Input: nums = [10]
 Output: 0
 Explanation: The array contains less than 2 elements, therefore return 0.
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109

 */
import Foundation

func maximumGap(_ nums: [Int]) -> Int {
    let n = nums.count
    let mi = nums.min()!
    let ma = nums.max()!
    if ma == mi {return ma - mi}
    let bucketSize = Int(ceil(Double(ma-mi) / Double(n-1)))
    var minMaxBucket = Array(repeating: (min: Int.max, max: Int.min), count: n )
    for num in nums {
        let idx = (num - mi) / bucketSize
        minMaxBucket[idx].min = min(minMaxBucket[idx].min, num)
        minMaxBucket[idx].max = max(minMaxBucket[idx].max, num)
    }
    var maxGap: Int = bucketSize
    var prev = minMaxBucket[0].max
    for i in 1..<n where minMaxBucket[i].min != Int.max {
        maxGap = max(maxGap, minMaxBucket[i].min - prev)
        prev = minMaxBucket[i].max
    }
    return maxGap
}
