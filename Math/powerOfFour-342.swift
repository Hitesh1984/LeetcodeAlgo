//
//  powerOfFour-342.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/3/25.
/*
 https://leetcode.com/problems/power-of-four/description/?envType=problem-list-v2&envId=math
 
 Given an integer n, return true if it is a power of four. Otherwise, return false.

 An integer n is a power of four, if there exists an integer x such that n == 4x.

  

 Example 1:

 Input: n = 16
 Output: true
 Example 2:

 Input: n = 5
 Output: false
 Example 3:

 Input: n = 1
 Output: true
  

 Constraints:

 -231 <= n <= 231 - 1
  
 */

func isPowerOfFour(_ n: Int) -> Bool {
    var n = n
    if n < 1 {
        return false
    } else {
        while n % 4 == 0 {
            n /= 4
        }
        return n==1
    }
}
