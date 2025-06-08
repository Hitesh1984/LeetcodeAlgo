//
//  palindrome-125.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/8/25.
//

/*
 https://leetcode.com/problems/valid-palindrome/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 
 Given a string s, return true if it is a palindrome, or false otherwise.
 
 
 
 Example 1:
 
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:
 
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:
 
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 
 
 Constraints:
 
 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 */
import Foundation

func isLetterOrNumber(_ char:Character) -> Bool {
    return char.isLetter && char.isNumber
}

func isPalindrome(_ s: String) -> Bool {
    guard !s.isEmpty else { return true}
    let s = Array(s)
    var left = 0
    var right = s.count-1
    // "A man, a plan, a canal: Panama"
    while left < right {
        if !isLetterOrNumber(s[left])  {
            left += 1
            continue
        }
        if !isLetterOrNumber(s[right])  {
            right -= 1
            continue
        }
        if s[left].lowercased() == s[right].lowercased() {
            left += 1
            right -= 1
        } else {
            return false
        }
    }
    return true
}
