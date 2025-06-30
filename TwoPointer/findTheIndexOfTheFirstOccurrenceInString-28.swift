//
//  File.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/9/25.

/*
 https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

  

 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
  

 Constraints:

 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.

 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    var arr = Array(haystack)
    let n = needle.count
    var start = 0
    while start <= arr.count - n {
        let temp = String(Array(arr[start...(start+n-1)]))
        if temp == needle {
            return start
        }else {
            start += 1
        }
    }
    return -1
}
