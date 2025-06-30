//
//  ReverseVowelsOfAString-345.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/15/25.

/*
 https://leetcode.com/problems/reverse-vowels-of-a-string/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

  

 Example 1:

 Input: s = "IceCreAm"

 Output: "AceCreIm"

 Explanation:

 The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".

 Example 2:

 Input: s = "leetcode"

 Output: "leotcede"

  

 Constraints:

 1 <= s.length <= 3 * 105
 s consist of printable ASCII characters.

 */

func reverseVowels(_ s: String) -> String {
    let vowels: Set<Character> = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]
    var (L, R) = (0, s.count - 1)
    var s = Array(s)
    while L < R {
        if !vowels.contains(s[L]) {
            L += 1
            continue
        }
        if !vowels.contains(s[R]) {
            R -= 1
            continue
        }
        s.swapAt(L, R)
        L += 1
        R -= 1
    }
    return String(s)
}
