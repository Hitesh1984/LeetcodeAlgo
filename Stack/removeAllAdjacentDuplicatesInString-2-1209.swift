//
//  removeAllAdjacentDuplicatesInString-2.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/22/25.
/*
 https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given a string s and an integer k, a k duplicate removal consists of choosing k adjacent and equal letters from s and removing them, causing the left and the right side of the deleted substring to concatenate together.

 We repeatedly make k duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It is guaranteed that the answer is unique.

  

 Example 1:

 Input: s = "abcd", k = 2
 Output: "abcd"
 Explanation: There's nothing to delete.
 Example 2:

 Input: s = "deeedbbcccbdaa", k = 3
 Output: "aa"
 Explanation:
 First delete "eee" and "ccc", get "ddbbbdaa"
 Then delete "bbb", get "dddaa"
 Finally delete "ddd", get "aa"
 Example 3:

 Input: s = "pbbcggttciiippooaais", k = 2
 Output: "ps"
  

 Constraints:

 1 <= s.length <= 105
 2 <= k <= 104
 s only contains lowercase English letters.

 */

func removeDuplicates(_ s: String, _ k: Int) -> String {
    var stack = [(char: Character, count: Int)]()
    for char in s {
        if let last = stack.last, last.char == char {
            if last.count == k-1 {
                for _ in 0..<k-1 {
                    stack.removeLast()
                }
            } else {
                stack.append((char, last.count+1))
            }
            
        } else {
            stack.append((char, 1))
        }
    }
    return String(stack.map { $0.char })
}
