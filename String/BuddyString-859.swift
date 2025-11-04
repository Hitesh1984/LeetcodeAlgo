//
//  BuddyString-959.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/16/25.
/*
 https://leetcode.com/problems/buddy-strings/description/?envType=problem-list-v2&envId=hash-table
 
 Given two strings s and goal, return true if you can swap two letters in s so the result is equal to goal, otherwise, return false.

 Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at s[i] and s[j].

 For example, swapping at indices 0 and 2 in "abcd" results in "cbad".
  

 Example 1:

 Input: s = "ab", goal = "ba"
 Output: true
 Explanation: You can swap s[0] = 'a' and s[1] = 'b' to get "ba", which is equal to goal.
 Example 2:

 Input: s = "ab", goal = "ab"
 Output: false
 Explanation: The only letters you can swap are s[0] = 'a' and s[1] = 'b', which results in "ba" != goal.
 Example 3:

 Input: s = "aa", goal = "aa"
 Output: true
 Explanation: You can swap s[0] = 'a' and s[1] = 'a' to get "aa", which is equal to goal.
  

 Constraints:

 1 <= s.length, goal.length <= 2 * 104
 s and goal consist of lowercase letters.
  
 */

func buddyStrings(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else { return false }
    guard s != goal else { return Set(s).count < s.count }
    
    var differenceDict = [(Character, Character)]()
    let v = zip(s, goal)
    for (s1, g1) in v where s1 != g1 {
        guard differenceDict.count < 2 else { return false }
        differenceDict.append((s1, g1))
    }
    guard differenceDict.count == 2 else { return false }
    return differenceDict.first?.0 == differenceDict.last?.1
    && differenceDict.first?.1 == differenceDict.last?.0
}
