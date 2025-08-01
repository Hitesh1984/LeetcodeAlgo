//
//  isomorphicStrings-205.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/isomorphic-strings/description/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

  

 Example 1:

 Input: s = "egg", t = "add"

 Output: true

 Explanation:

 The strings s and t can be made identical by:

 Mapping 'e' to 'a'.
 Mapping 'g' to 'd'.
 Example 2:

 Input: s = "foo", t = "bar"

 Output: false

 Explanation:

 The strings s and t can not be made identical as 'o' needs to be mapped to both 'a' and 'r'.

 Example 3:

 Input: s = "paper", t = "title"

 Output: true

  

 Constraints:

 1 <= s.length <= 5 * 104
 t.length == s.length
 s and t consist of any valid ascii character.

 */

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var dictS = [Character: Character]()
    var dictT = [Character: Character]()
    for (sChar, tChar) in zip(s,t) {
        if let mappedSChar = dictS[sChar] {
            if mappedSChar != tChar {
                return false
            }
        } else {
            dictS[sChar] = tChar
        }
        
        if let mappedTChar = dictT[tChar] {
            if  mappedTChar != sChar {
                return false
            }
        } else {
            dictT[tChar] = sChar
        }
    }
    return true
}
