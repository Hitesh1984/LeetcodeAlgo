//
//  keyboardRow-500.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/4/25.
/*
 https://leetcode.com/problems/keyboard-row/description/?envType=problem-list-v2&envId=hash-table
 
 Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.

 Note that the strings are case-insensitive, both lowercased and uppercased of the same letter are treated as if they are at the same row.

 In the American keyboard:

 the first row consists of the characters "qwertyuiop",
 the second row consists of the characters "asdfghjkl", and
 the third row consists of the characters "zxcvbnm".

  

 Example 1:

 Input: words = ["Hello","Alaska","Dad","Peace"]

 Output: ["Alaska","Dad"]

 Explanation:

 Both "a" and "A" are in the 2nd row of the American keyboard due to case insensitivity.

 Example 2:

 Input: words = ["omk"]

 Output: []

 Example 3:

 Input: words = ["adsdf","sfd"]

 Output: ["adsdf","sfd"]

  

 Constraints:

 1 <= words.length <= 20
 1 <= words[i].length <= 100
 words[i] consists of English letters (both lowercase and uppercase).
  
 */

func findWords(_ words: [String]) -> [String] {
    let row1 = Set("qwertyuiop")
    let row2 = Set("asdfghjkl")
    let row3 = Set("zxcvbnm")
    
    var matching: [String] = []
    for word in words {
        let set = Set(word.lowercased())
        if set.isSubset(of: row1) || set.isSubset(of: row2) || set.isSubset(of: row3) {
            matching.append(word)
        }
    }
    return matching
}
