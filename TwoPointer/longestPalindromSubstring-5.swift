//
//  longestPalindromSubstring-5.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/7/25.
//
/*
 https://leetcode.com/problems/longest-palindromic-substring/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string s, return the longest palindromic substring in s.
 
 
 
 Example 1:
 
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:
 
 Input: s = "cbbd"
 Output: "bb"
 
 
 Constraints:
 
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */
import Foundation


func longestPalindrome(_ s: String) -> String {
    var startIndex = 0
    var lastIndex = 0
    var resLen = 0
    var s = Array(s)
    for i in 0..<s.count {
        var l = i
        var r = i
        getMaxPalindrome(&l,&r)
    }
    for i in 0..<s.count {
        var l = i
        var r = i + 1
        getMaxPalindrome(&l,&r)
    }
    func getMaxPalindrome(_ l:inout Int, _ r:inout Int) {
        while l >= 0 && r < s.count && s[l] == s[r] {
            if(r - l + 1) > resLen {
                startIndex = l
                lastIndex = r+1
                resLen = r - l + 1
            }
            l -= 1
            r += 1
        }
    }
    
    if resLen > 0 {
        return Array(s[startIndex..<(lastIndex)]).map(String.init).joined(separator: "")
    } else {
        return ""
    }
}
