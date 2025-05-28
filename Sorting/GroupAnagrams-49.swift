//
//  GroupAnagrams.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/4/25.
//

import Foundation
/*
 https://leetcode.com/problems/group-anagrams/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]

 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:

 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 Example 2:

 Input: strs = [""]

 Output: [[""]]

 Example 3:

 Input: strs = ["a"]

 Output: [["a"]]

  

 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 
 
 */


func getGroupAnagrams(_ listOfStr:[String]) -> [[String]] {
    if listOfStr.isEmpty { return [] }
    var hashMap = [String : [String]]()
    for str in listOfStr {
        let sortedStr = String(str.sorted())
        
        if var previousObj = hashMap[sortedStr] as? [String] {
            previousObj.append(str)
            hashMap[sortedStr] = previousObj
        } else {
            hashMap[sortedStr] = [str]
        }
    }
    return Array(hashMap.values)
}
