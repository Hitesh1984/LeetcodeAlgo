//
//  countVowelSubstringsofString-2062.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/24/25.
/*
 https://leetcode.com/problems/count-vowel-substrings-of-a-string/description/?envType=problem-list-v2&envId=string
 
 A substring is a contiguous (non-empty) sequence of characters within a string.

 A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.

 Given a string word, return the number of vowel substrings in word.

  

 Example 1:

 Input: word = "aeiouu"
 Output: 2
 Explanation: The vowel substrings of word are as follows (underlined):
 - "aeiouu"
 - "aeiouu"
 Example 2:

 Input: word = "unicornarihan"
 Output: 0
 Explanation: Not all 5 vowels are present, so there are no vowel substrings.
 Example 3:

 Input: word = "cuaieuouac"
 Output: 7
 Explanation: The vowel substrings of word are as follows (underlined):
 - "cuaieuouac"
 - "cuaieuouac"
 - "cuaieuouac"
 - "cuaieuouac"
 - "cuaieuouac"
 - "cuaieuouac"
 - "cuaieuouac"
  

 Constraints:

 1 <= word.length <= 100
 word consists of lowercase English letters only.

 */

func countVowelSubstrings(_ word: String) -> Int {
    guard word.count > 4 else { return 0 }
    let word = Array(word)
    var vowels = Set<Character>("aeiou")
    var result = 0
    for i in 0..<word.count where vowels.contains(word[i]) {
        var remainingVowels = vowels
        for ch in word[i ..< word.count] {
            guard vowels.contains(ch) else { break  }
            remainingVowels.remove(ch)
            if remainingVowels.isEmpty {
                result += 1
            }
        }
    }
    return result
}
