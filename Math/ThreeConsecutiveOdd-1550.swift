//
//  ThreeConsecutiveOdd-1550.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/9/25.
/*
 https://leetcode.com/problems/three-consecutive-odds/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer array arr, return true if there are three consecutive odd numbers in the array. Otherwise, return false.
  

 Example 1:

 Input: arr = [2,6,4,1]
 Output: false
 Explanation: There are no three consecutive odds.
 Example 2:

 Input: arr = [1,2,34,3,4,5,7,23,12]
 Output: true
 Explanation: [5,7,23] are three consecutive odds.
  

 Constraints:

 1 <= arr.length <= 1000
 1 <= arr[i] <= 1000

 */

func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
    var cur = 0
    var ind = 0
    while ind < arr.count {
        if arr[ind] % 2 == 1 {
            cur += 1
            ind += 1
            if (ind < arr.count) && arr[ind] % 2 == 1 {
                cur += 1
                ind += 1
                if (ind < arr.count) && arr[ind] % 2 == 1 {
                    return true
                }
            }
        }
        cur = 0
        ind += 1
    }
    return false
    
}
