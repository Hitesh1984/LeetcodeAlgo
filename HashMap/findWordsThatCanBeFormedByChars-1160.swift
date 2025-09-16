//
//  findWordsThatCanBeFormedByChars-1160.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/17/25.
/*
 https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/description/?envType=company&envId=paypal&favoriteSlug=paypal-six-months
 
 You are given an array of strings words and a string chars.

 A string is good if it can be formed by characters from chars (each character can only be used once for each word in words).

 Return the sum of lengths of all good strings in words.

  

 Example 1:

 Input: words = ["cat","bt","hat","tree"], chars = "atach"
 Output: 6
 Explanation: The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
 Example 2:

 Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
 Output: 10
 Explanation: The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
  

 Constraints:

 1 <= words.length <= 1000
 1 <= words[i].length, chars.length <= 100
 words[i] and chars consist of lowercase English letters.

 */

func countCharacters(_ words: [String], _ chars: String) -> Int {
    var result = 0
    var chars = Array(chars).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    for word in words {
        var invalid = false
        var copy = chars
        for char in word {
            guard let total = copy[char], total > 0 else {
                invalid = true
                break
            }
            copy[char, default: 0] = total - 1
        }
        result += invalid ? 0 : word.count
    }
    return result
}
