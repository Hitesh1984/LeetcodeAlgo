//
//  mostCommonWord-819.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/15/25.
/*
 https://leetcode.com/problems/most-common-word/description/?envType=problem-list-v2&envId=hash-table
 
 Given a string paragraph and a string array of the banned words banned, return the most frequent word that is not banned. It is guaranteed there is at least one word that is not banned, and that the answer is unique.

 The words in paragraph are case-insensitive and the answer should be returned in lowercase.

 Note that words can not contain punctuation symbols.

  

 Example 1:

 Input: paragraph = "Bob hit a ball, the hit BALL flew far after it was hit.", banned = ["hit"]
 Output: "ball"
 Explanation:
 "hit" occurs 3 times, but it is a banned word.
 "ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph.
 Note that words in the paragraph are not case sensitive,
 that punctuation is ignored (even if adjacent to words, such as "ball,"),
 and that "hit" isn't the answer even though it occurs more because it is banned.
 Example 2:

 Input: paragraph = "a.", banned = []
 Output: "a"
  

 Constraints:

 1 <= paragraph.length <= 1000
 paragraph consists of English letters, space ' ', or one of the symbols: "!?',;.".
 0 <= banned.length <= 100
 1 <= banned[i].length <= 10
 banned[i] consists of only lowercase English letters.
  
 */

func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
    var map: [String: Int] = [String: Int]()
    
    let fixedParagraph = paragraph.lowercased().split{ !$0.isLetter }
    
    var highest = 0
    var key = ""
    fixedParagraph.forEach { (word) in
        let wd = String(word)
        if !banned.contains(wd) {
            map[wd, default:0] += 1
            if highest < map[wd, default:0] {
                highest = map[wd, default:0]
                key = wd
            }
        }
    }
    return key
}
