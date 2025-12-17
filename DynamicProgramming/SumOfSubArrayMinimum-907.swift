//
//  SumOfSubArrayMinimum-907.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/7/25.
/*
 https://leetcode.com/problems/sum-of-subarray-minimums/description/?envType=problem-list-v2&envId=dynamic-programming
 
 Given an array of integers arr, find the sum of min(b), where b ranges over every (contiguous) subarray of arr. Since the answer may be large, return the answer modulo 109 + 7.

  

 Example 1:

 Input: arr = [3,1,2,4]
 Output: 17
 Explanation:
 Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4].
 Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
 Sum is 17.
 Example 2:

 Input: arr = [11,81,94,43,3]
 Output: 444
  

 Constraints:

 1 <= arr.length <= 3 * 104
 1 <= arr[i] <= 3 * 104
  
 */

func sumSubarrayMins(_ arr: [Int]) -> Int {
    var stack = [(Int, Int)]()
    var result = 0
    for i in 0 ..< arr.count {
        while let (val, _) = stack.last, val > arr[i] {
            stack.removeLast()
        }
        stack.append((arr[i], i))
        var lastInd = -1
        for (val, ind) in stack {
            result += val * (ind - lastInd)
            result %= 1_000_000_007
            lastInd = ind
        }
    }
    return result
}
