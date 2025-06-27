//
//  RotateString-796.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/rotate-string/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given two strings s and goal, return true if and only if s can become goal after some number of shifts on s.

 A shift on s consists of moving the leftmost character of s to the rightmost position.

 For example, if s = "abcde", then it will be "bcdea" after one shift.
  

 Example 1:

 Input: s = "abcde", goal = "cdeab"
 Output: true
 Example 2:

 Input: s = "abcde", goal = "abced"
 Output: false
  

 Constraints:

 1 <= s.length, goal.length <= 100
 s and goal consist of lowercase English letters.

 */

func rotateString(_ s: String, _ goal: String) -> Bool {
        if s.count != goal.count { return false }
        return (goal + goal).contains(s)
}

func rotateString12(_ s: String, _ goal: String) -> Bool {
    var sArr = Array(s)
    
    for i in 0..<s.count{
        let firstChar = sArr.removeFirst()
        sArr.append(firstChar)
        if goal == String(sArr){
            return true
        }
    }
    
    return false
}
