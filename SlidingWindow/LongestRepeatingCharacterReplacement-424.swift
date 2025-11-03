//
//  LongestRepeatingCharacterReplacement.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/25/25.
//


/*
 https://leetcode.com/problems/longest-repeating-character-replacement/description/
 
 
 
 424. Longest Repeating Character Replacement
 Medium
 Topics
 Companies
 You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

 Return the length of the longest substring containing the same letter you can get after performing the above operations.

  

 Example 1:

 Input: s = "ABAB", k = 2
 Output: 4
 Explanation: Replace the two 'A's with two 'B's or vice versa.
 Example 2:

 Input: s = "AABABBA", k = 1
 Output: 4
 Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 There may exists other ways to achieve this answer too.
  

 Constraints:

 1 <= s.length <= 105
 s consists of only uppercase English letters.
 0 <= k <= s.length
 
 */
import Foundation


/*
func characterReplacement(_ input: String, _ k: Int) -> Int {
        
    var hashMap = [String:Int]()
    var left = 0
    var res = 0
    var maxf = 0
    
    for right in stride(from: 0, through: input.count, by: 1) {
        let ch = input[right]
        if let count = hashMap[ch] {
            hashMap[ch] = count + 1
        } else {
            hashMap[ch] = 1
        }
        
        maxf = max(maxf, hashMap[ch]!)
        
        while (right - left + 1) - maxf > k {
            let leftCh = input[left]
            hashMap[leftCh]! -= 1
            left += 1
        }
        
        res = max(res, right - left + 1)
    }
    return res
}
 */



 
 func characterReplacement(_ input: String, _ k: Int) -> Int {
         
     var hashMap = [Character:Int]()
     var left = 0
     var res = 0
     var maxf = 0
     let input = Array(input)
     
     for (right,ch) in input.enumerated() {
         if let count = hashMap[ch] {
             hashMap[ch] = count + 1
         } else {
             hashMap[ch] = 1
         }
         
         maxf = max(maxf, hashMap[ch]!)
         
         while (right - left + 1) - maxf > k {
             let leftCh = input[left]
             hashMap[leftCh]! -= 1
             left += 1
         }
         
         res = max(res, right - left + 1)
     }
     return res
 }
 
