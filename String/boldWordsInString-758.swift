//
//  boldWordsInString-758.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/22/25.
/*
 https://leetcode.com/problems/bold-words-in-string/description/?envType=problem-list-v2&envId=string-matching
 
 Given an array of keywords words and a string s, make all appearances of all keywords words[i] in s bold. Any letters between <b> and </b> tags become bold.

 Return s after adding the bold tags. The returned string should use the least number of tags possible, and the tags should form a valid combination.

  

 Example 1:

 Input: words = ["ab","bc"], s = "aabcd"
 Output: "a<b>abc</b>d"
 Explanation: Note that returning "a<b>a<b>b</b>c</b>d" would use more tags, so it is incorrect.
 Example 2:

 Input: words = ["ab","cb"], s = "aabcd"
 Output: "a<b>ab</b>cd"
  

 Constraints:

 1 <= s.length <= 500
 0 <= words.length <= 50
 1 <= words[i].length <= 10
 s and words[i] consist of lowercase English letters.
  
 */

func boldWords(_ words: [String], _ S: String) -> String {
    guard !S.isEmpty else { return "" }
    let s = Array(S)
    let n = S.count
    var mask = [Bool](repeating: false, count: n)
    
    for i in 0..<n {
    search: for word in words {
        for (k, w) in word.enumerated() {
            guard k+i >= n || s[k+i] != w else { continue }
            continue search
        }
        for j in i..<i+word.count {
            mask[j] = true
        }
    }
    }
    
    var ans = [String]()
    for i in 0..<n {
        if mask[i], (i == 0 || !mask[i-1]) {
            ans.append("<b>")
        }
        ans.append(String(s[i]))
        if mask[i], (i == n-1 || !mask[i+1]) {
            ans.append("</b>")
        }
    }
    return ans.joined()
}
