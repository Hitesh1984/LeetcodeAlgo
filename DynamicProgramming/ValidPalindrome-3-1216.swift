//
//  ValidPalindrome-3-1216.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/4/25.
/*
 https://leetcode.com/problems/valid-palindrome-iii/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string s and an integer k, return true if s is a k-palindrome.

 A string is k-palindrome if it can be transformed into a palindrome by removing at most k characters from it.

  

 Example 1:

 Input: s = "abcdeca", k = 2
 Output: true
 Explanation: Remove 'b' and 'e' characters.
 Example 2:

 Input: s = "abbababa", k = 1
 Output: true
  

 Constraints:

 1 <= s.length <= 1000
 s consists of only lowercase English letters.
 1 <= k <= s.length

 */

func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
    let characters = Array(s)
    var memo: [String: Bool] = [:]
    return isPalindromePossible(0, characters.count - 1, k)
    
    func isPalindromePossible(_ start: Int, _ end: Int, _ remaining: Int) -> Bool {
        var left = start
        var right = end
        let key = "\(left),\(right),\(remaining),"
        if let result = memo[key] {
            return result
        }
        while left < right {
            if characters[left] != characters[right] {
                if remaining == 0 {
                    memo[key] = false
                    return false
                }
                if (isPalindromePossible(left + 1, right, remaining - 1)) {
                    memo[key] = true
                    return true
                }
                if (isPalindromePossible(left, right - 1, remaining - 1)) {
                    memo[key] = true
                    return true
                }
                memo[key] = false
                return false
            } else {
                left += 1
                right -= 1
            }
        }
        memo[key] = true
        return true
    }
}
