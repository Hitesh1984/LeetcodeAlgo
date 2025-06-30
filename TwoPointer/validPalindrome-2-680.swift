//
//  validPalindrome-2-680.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.

/*
 https://leetcode.com/problems/valid-palindrome-ii/description/?envType=company&envId=facebook&favoriteSlug=facebook-thirty-days
 
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

  

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
*/

func validPalindrome(_ s: String) -> Bool {
    var s = Array(s)
    var left = 0
    var right = s.count - 1
    
    while left < right{
        if s[left] != s[right]{
            return checkValid(left + 1, right) || checkValid(left, right - 1)
        }
        left += 1
        right -= 1
    }
    
    func checkValid(_ l: Int, _ r: Int) -> Bool{
        var l = l
        var r = r
        while l < r && s[l] == s[r]{
            l += 1
            r -= 1
        }
        return l >= r
    }
    
    return true
}
