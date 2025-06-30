//
//  palindromicSubstrings-647.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/20/25.
/*
 https://leetcode.com/problems/palindromic-substrings/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string s, return the number of palindromic substrings in it.

 A string is a palindrome when it reads the same backward as forward.

 A substring is a contiguous sequence of characters within the string.

  

 Example 1:

 Input: s = "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
 Example 2:

 Input: s = "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
  

 Constraints:

 1 <= s.length <= 1000
 s consists of lowercase English letters.

 */

func countSubstrings(_ s: String) -> Int {
    var s = Array(s)
    let count = s.count
    var res = 0
    
    func countPalindrome(_ left:Int, _ right:Int) {
        var left = left
        var right = right
        while left >= 0 && right < count && s[left] == s[right] {
            res += 1
            left -= 1
            right += 1
        }
    }
    
    for ind in 0..<count {
        res += 1
        // This is for odd length Palindrome
        countPalindrome(ind-1, ind+1)
        
        // This is for even length Palindrome
        countPalindrome(ind, ind+1)
    }
    return res
}
