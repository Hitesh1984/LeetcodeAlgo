//
//  sumOfSquareNumber-633.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/25/25.
/*
 https://leetcode.com/problems/sum-of-square-numbers/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a non-negative integer c, decide whether there're two integers a and b such that a2 + b2 = c.

  

 Example 1:

 Input: c = 5
 Output: true
 Explanation: 1 * 1 + 2 * 2 = 5
 Example 2:

 Input: c = 3
 Output: false
  

 Constraints:

 0 <= c <= 231 - 1

 */
import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
    if c < 0 { return false }
    if c == 0 || c == 1 || c == 2 { return true }
    let root = Int(sqrt(Double(c)))
    
    for i in 1...root {
        let rem = c - (i * i)
        let rootRem = Int(sqrt(Double(rem)))
        if rootRem * rootRem == rem {
            return true
        }
    }
    return false
}
