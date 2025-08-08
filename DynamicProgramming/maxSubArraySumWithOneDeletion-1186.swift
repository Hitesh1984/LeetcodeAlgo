//
//  maxSubArraySumWithOneDeletion-1186.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/30/25.
/*
 https://leetcode.com/problems/maximum-subarray-sum-with-one-deletion/description/?envType=company&envId=amazon&favoriteSlug=amazon-thirty-days
 
 Given an array of integers, return the maximum sum for a non-empty subarray (contiguous elements) with at most one element deletion. In other words, you want to choose a subarray and optionally delete one element from it so that there is still at least one element left and the sum of the remaining elements is maximum possible.

 Note that the subarray needs to be non-empty after deleting one element.

  

 Example 1:

 Input: arr = [1,-2,0,3]
 Output: 4
 Explanation: Because we can choose [1, -2, 0, 3] and drop -2, thus the subarray [1, 0, 3] becomes the maximum value.
 Example 2:

 Input: arr = [1,-2,-2,3]
 Output: 3
 Explanation: We just choose [3] and it's the maximum sum.
 Example 3:

 Input: arr = [-1,-1,-1,-1]
 Output: -1
 Explanation: The final subarray needs to be non-empty. You can't choose [-1] and delete -1 from it, then get an empty subarray to make the sum equals to 0.
  

 Constraints:

 1 <= arr.length <= 105
 -104 <= arr[i] <= 104

 */

func maximumSum(_ arr: [Int]) -> Int {
    var fwd = Array(repeating: 0, count: arr.count)
    var bwd = Array(repeating: 0, count: arr.count)
    fwd[0] = arr[0]
    var maxSum = arr[0]
    
    for i in 1..<arr.count {
        fwd[i] = max(fwd[i-1] + arr[i] , arr[i])
        maxSum = max(maxSum, fwd[i])
    }
    
    var j = arr.count - 1
    bwd[j] = arr[j]
    while j > 0 {
        bwd[j-1] = max(arr[j-1], bwd[j] + arr[j-1])
        j -= 1
    }
    
    var i = 1
    while i < arr.count - 1 {
        maxSum = max(maxSum, fwd[i-1] + bwd[i+1])
        i += 1
    }
    return maxSum
}
