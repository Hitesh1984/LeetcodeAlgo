//
//  DeleeteOpnFor2Strings-583.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/3/25.
/*
 
 https://leetcode.com/problems/delete-operation-for-two-strings/description/?envType=problem-list-v2&envId=dynamic-programming
 
 Given two strings word1 and word2, return the minimum number of steps required to make word1 and word2 the same.

 In one step, you can delete exactly one character in either string.

  

 Example 1:

 Input: word1 = "sea", word2 = "eat"
 Output: 2
 Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
 Example 2:

 Input: word1 = "leetcode", word2 = "etco"
 Output: 4
  

 Constraints:

 1 <= word1.length, word2.length <= 500
 word1 and word2 consist of only lowercase English letters.

 */

func minDistance234(_ word1: String, _ word2: String) -> Int {
    if(word1 == word2) {    return 0 }
    if(word1.count == 0) {  return word2.count }
    if(word2.count == 0) {  return word1.count }
    let cnt1 = word1.count
    let cnt2 = word2.count
    var dp = Array(repeating:Array(repeating:0,count:cnt2 + 1),count:cnt1 + 1)
    for (i, char1) in word1.enumerated() {
        for (j,char2) in word2.enumerated() {
            if char1 == char2 {
                dp[i+1][j+1] =  dp[i][j] + 1
            }else {
                dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
            }
        }
    }
    return cnt1  + cnt2 - ( 2 * dp[cnt1][cnt2] )
}
