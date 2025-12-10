//
//  lengthOfLongestFibonacciSubsequence-873.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/5/25.
/*
 https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/description/?envType=problem-list-v2&envId=dynamic-programming
 
 A sequence x1, x2, ..., xn is Fibonacci-like if:

 n >= 3
 xi + xi+1 == xi+2 for all i + 2 <= n
 Given a strictly increasing array arr of positive integers forming a sequence, return the length of the longest Fibonacci-like subsequence of arr. If one does not exist, return 0.

 A subsequence is derived from another sequence arr by deleting any number of elements (including none) from arr, without changing the order of the remaining elements. For example, [3, 5, 8] is a subsequence of [3, 4, 5, 6, 7, 8].

  

 Example 1:

 Input: arr = [1,2,3,4,5,6,7,8]
 Output: 5
 Explanation: The longest subsequence that is fibonacci-like: [1,2,3,5,8].
 Example 2:

 Input: arr = [1,3,7,11,12,14,18]
 Output: 3
 Explanation: The longest subsequence that is fibonacci-like: [1,11,12], [3,11,14] or [7,11,18].
  

 Constraints:

 3 <= arr.length <= 1000
 1 <= arr[i] < arr[i + 1] <= 109
  
 */

func lenLongestFibSubseq(_ arr: [Int]) -> Int {
    var dp = Array(repeating:Array(repeating:0, count:arr.count), count:arr.count)
    var count = 0
    for (ind, cur) in arr.enumerated() where ind > 1 {
        var l = 0
        var r = ind-1

        while l < r {
            let sign = (arr[l]+arr[r] - cur).signum()
            if sign == 0 {
                dp[r][ind] = dp[l][r] + 1
                count = max(dp[r][ind], count)
            }
            (l,r) = sign<0 ? (l+1,r) : (l,r-1)
        }
    }
    
    
    return count > 0 ? count+2 : 0
}
