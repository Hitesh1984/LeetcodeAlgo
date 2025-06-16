//
//  maximumSwap-670.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.

/*
 https://leetcode.com/problems/maximum-swap/description/?envType=company&envId=facebook&favoriteSlug=facebook-thirty-days
 
 You are given an integer num. You can swap two digits at most once to get the maximum valued number.

 Return the maximum valued number you can get.

  

 Example 1:

 Input: num = 2736
 Output: 7236
 Explanation: Swap the number 2 and the number 7.
 Example 2:

 Input: num = 9973
 Output: 9973
 Explanation: No swap.
  

 Constraints:

 0 <= num <= 108

 */

func maximumSwap(_ num: Int) -> Int {
    var arr = String(num).compactMap { $0.wholeNumberValue }
    var swap1 = 0, swap2 = 0
    var max = -1
    var maxIndex = -1
    for (index, digit) in arr.enumerated().reversed() {
        if digit > max {
            max = digit
            maxIndex = index
        } else if digit < max {
            swap2 = maxIndex
            swap1 = index
        }
    }
    arr.swapAt(swap1, swap2)
    return Int(arr.map { String($0) }.joined(separator: "")) ?? 0
}
