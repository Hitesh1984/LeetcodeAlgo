//
//  removeAllAdjacentDuplicatesInString-1047.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

 We repeatedly make duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

  

 Example 1:

 Input: s = "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
 Example 2:

 Input: s = "azxxzy"
 Output: "ay"
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.

 */

func removeDuplicates(_ s: String) -> String {
    var stack = [Character]()
    
    for char in s {
        if !stack.isEmpty && stack.last! == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    return String(stack)
}
