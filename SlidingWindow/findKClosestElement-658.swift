//
//  findKClosestElement-658.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/4/25.
/*
 https://leetcode.com/problems/find-k-closest-elements/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.

 An integer a is closer to x than an integer b if:

 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
  

 Example 1:

 Input: arr = [1,2,3,4,5], k = 4, x = 3

 Output: [1,2,3,4]

 Example 2:

 Input: arr = [1,1,2,3,4,5], k = 4, x = -1

 Output: [1,1,2,3]

  

 Constraints:

 1 <= k <= arr.length
 1 <= arr.length <= 104
 arr is sorted in ascending order.
 -104 <= arr[i], x <= 104

 */

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var lowIndex = 0
    var higherIndex = arr.count - 1
    if x < arr[lowIndex] {
        return Array(arr[..<k])
    }
    if x > arr[higherIndex] {
        return Array(arr[(higherIndex-k+1)...])
    }
    while(higherIndex - lowIndex >= k) {
        if abs(arr[lowIndex] - x) > abs(arr[higherIndex] - x) { //
            lowIndex += 1
        }
        else {
            higherIndex -= 1
        }
    }
    return Array(arr[lowIndex...higherIndex])
}
