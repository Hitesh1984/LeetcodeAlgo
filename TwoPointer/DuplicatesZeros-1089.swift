//
//  DuplicatesZeros-1089.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/duplicate-zeros/description/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Given a fixed-length integer array arr, duplicate each occurrence of zero, shifting the remaining elements to the right.

 Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.

  

 Example 1:

 Input: arr = [1,0,2,3,0,4,5,0]
 Output: [1,0,0,2,3,0,0,4]
 Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
 Example 2:

 Input: arr = [1,2,3]
 Output: [1,2,3]
 Explanation: After calling your function, the input array is modified to: [1,2,3]
  

 Constraints:

 1 <= arr.length <= 104
 0 <= arr[i] <= 9
 */

func duplicateZeros(_ arr: inout [Int]) {
    var i = 0
    while i < arr.count {
        if arr[i] == 0 {
            arr.insert(0, at: i)
            arr.removeLast()
            i += 2
        }
        else {
            i += 1
        }
    }
}
