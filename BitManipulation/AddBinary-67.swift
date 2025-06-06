//
//  AddBinary-67.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.

/*
 https://leetcode.com/problems/add-binary/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two binary strings a and b, return their sum as a binary string.

  

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 */

func addBinary(_ a: String, _ b: String) -> String {
    let a = Array(a)
    let b = Array(b)
    var result = [Character]()
    var carry = 0
    let aCnt = a.count
    let bCnt = b.count
    for i in 0..<max(aCnt, bCnt) {
        var sum = carry
        if i < aCnt && a[aCnt - i - 1] == "1" {
            sum += 1
        }
        if i < bCnt && b[bCnt - i - 1] == "1" {
            sum += 1
        }
        carry = sum / 2
        result.append(sum % 2 > 0 ? "1" : "0")
    }
    if carry > 0 {
        result.append("1")
    }
    return String(result.reversed())
}
