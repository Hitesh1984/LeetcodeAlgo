//
//  Base-7-504.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/28/25.
/*
 https://leetcode.com/problems/base-7/description/?envType=problem-list-v2&envId=math
 
 Given an integer num, return a string of its base 7 representation.

  

 Example 1:

 Input: num = 100
 Output: "202"
 Example 2:

 Input: num = -7
 Output: "-10"
  

 Constraints:

 -107 <= num <= 107
 */

func convertToBase7(_ num: Int) -> String {
    var n = abs(num)
    var i = 1
    var result = 0
    
    while n > 0 {
        result += (n % 7) * i
        i *= 10
        n /= 7
    }
    return num.signum() == -1 ? "-\(result)" : "\(result)"
}
