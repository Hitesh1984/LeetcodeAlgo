//
//  ReorderedPowerOf2-869.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/2/25.
/*
 https://leetcode.com/problems/reordered-power-of-2/description/?envType=problem-list-v2&envId=math
 
 You are given an integer n. We reorder the digits in any order (including the original order) such that the leading digit is not zero.

 Return true if and only if we can do this so that the resulting number is a power of two.

  

 Example 1:

 Input: n = 1
 Output: true
 Example 2:

 Input: n = 10
 Output: false
  

 Constraints:

 1 <= n <= 109
 */

import Foundation

func reorderedPowerOf2(_ n: Int) -> Bool {
    
    func dig(_ n: Int) -> [Int] {
        var x = n
        var arr = Array(repeating: 0, count: 10)
        while x > 0 {
            arr[x % 10] += 1
            x /= 10
        }
        return arr
    }
    
    guard n != 1 else { return true }
    var a = 1
    let arrN = dig(n)
    
    for i in 1..<31 {
        a <<= 1
        if arrN == dig(a) {
            return true
        }
    }
    
    return false
}
