//
//  validAnagram-241.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/26/25.

/*
 https://leetcode.com/problems/valid-anagram/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

  

 Example 1:

 Input: s = "anagram", t = "nagaram"

 Output: true

 Example 2:

 Input: s = "rat", t = "car"

 Output: false

  

 Constraints:

 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
  
 */

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var map = [Character : Int]()
    for (c1, c2) in zip(s,t) {
        map[c1, default: 0] += 1
        map[c2, default: 0] -= 1
    }
    return map.reduce( 0, { $0 + abs($1.value) }) == 0
}

/*
 func isAnagram(_ s: String, _ t: String) -> Bool {
         if s.count != t.count {
             return false
         }
         var hashMap = [Character:Int]()
         for (ch1,ch2) in zip(s,t) {
             hashMap[ch1, default:0] += 1
             hashMap[ch2, default:0] -= 1
             if hashMap[ch2] == 0 {
                 hashMap.removeValue(forKey:ch2)
             }
             if hashMap[ch1] == 0 {
                 hashMap.removeValue(forKey:ch1)
             }
         }
         if hashMap.count == 0 {
             return true
         }
         return false
     }
 */
