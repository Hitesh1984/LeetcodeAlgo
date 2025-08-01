//
//  kthMisssingPositiveNumber-1539.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.
/*
 https://leetcode.com/problems/kth-missing-positive-number/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an array arr of positive integers sorted in a strictly increasing order, and an integer k.

 Return the kth positive integer that is missing from this array.

  

 Example 1:

 Input: arr = [2,3,4,7,11], k = 5
 Output: 9
 Explanation: The missing positive integers are [1,5,6,8,9,10,12,13,...]. The 5th missing positive integer is 9.
 Example 2:

 Input: arr = [1,2,3,4], k = 2
 Output: 6
 Explanation: The missing positive integers are [5,6,7,...]. The 2nd missing positive integer is 6.
  

 Constraints:

 1 <= arr.length <= 1000
 1 <= arr[i] <= 1000
 1 <= k <= 1000
 arr[i] < arr[j] for 1 <= i < j <= arr.length
  

 Follow up:

 Could you solve this problem in less than O(n) complexity?


 */

func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
    var l = 0
    var r = arr.count - 1
    while l <= r {
        let mid = l + (r - l)/2
        if arr[mid] - mid - 1 < k {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }
    return  l + k
}
