//
//  powerOfThree-326.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/6/25.
/*
 https://leetcode.com/problems/power-of-three/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer n, return true if it is a power of three. Otherwise, return false.

 An integer n is a power of three, if there exists an integer x such that n == 3x.

  

 Example 1:

 Input: n = 27
 Output: true
 Explanation: 27 = 33
 Example 2:

 Input: n = 0
 Output: false
 Explanation: There is no x where 3x = 0.
 Example 3:

 Input: n = -1
 Output: false
 Explanation: There is no x where 3x = (-1).
  

 Constraints:

 -231 <= n <= 231 - 1
  
 */

func isPowerOfThree(_ n: Int) -> Bool {
    var x = n
    if n == 0 { return false }
    while x % 3 == 0 {
        x /= 3
    }
    
    return x == 1
}
