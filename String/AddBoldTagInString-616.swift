//
//  AddBoldTagInString.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/21/25.
/*
 https://leetcode.com/problems/add-bold-tag-in-string/description/?envType=problem-list-v2&envId=string-matching
 
 You are given a string s and an array of strings words.

 You should add a closed pair of bold tag <b> and </b> to wrap the substrings in s that exist in words.

 If two such substrings overlap, you should wrap them together with only one pair of closed bold-tag.
 If two substrings wrapped by bold tags are consecutive, you should combine them.
 Return s after adding the bold tags.

  

 Example 1:

 Input: s = "abcxyz123", words = ["abc","123"]
 Output: "<b>abc</b>xyz<b>123</b>"
 Explanation: The two strings of words are substrings of s as following: "abcxyz123".
 We add <b> before each substring and </b> after each substring.
 Example 2:

 Input: s = "aaabbb", words = ["aa","b"]
 Output: "<b>aaabbb</b>"
 Explanation:
 "aa" appears as a substring two times: "aaabbb" and "aaabbb".
 "b" appears as a substring three times: "aaabbb", "aaabbb", and "aaabbb".
 We add <b> before each substring and </b> after each substring: "<b>a<b>a</b>a</b><b>b</b><b>b</b><b>b</b>".
 Since the first two <b>'s overlap, we merge them: "<b>aaa</b><b>b</b><b>b</b><b>b</b>".
 Since now the four <b>'s are consecutive, we merge them: "<b>aaabbb</b>".
  

 Constraints:

 1 <= s.length <= 1000
 0 <= words.length <= 100
 1 <= words[i].length <= 1000
 s and words[i] consist of English letters and digits.
 All the values of words are unique.

 */

func addBoldTag(_ s: String, _ dict: [String]) -> String {
    guard !s.isEmpty else { return "" }
    let s = Array(s)
    let n = s.count
    var mask = [Bool](repeating: false, count: n)
    for i in 0..<n {
        search: for word in dict {
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
