//
//  reOrganizeString-767.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/2/25.
//
/*
 
 https://leetcode.com/problems/reorganize-string/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.
 
 Return any possible rearrangement of s or return "" if not possible.
 
 
 
 Example 1:
 
 Input: s = "aab"
 Output: "aba"
 Example 2:
 
 Input: s = "aaab"
 Output: ""
 
 
 Constraints:
 
 1 <= s.length <= 500
 s consists of lowercase English letters.
 */
import Foundation
import Collections


struct FreqChar: Comparable {
    let char: Character
    var count: Int
    
    static func < (lhs:FreqChar, rhs:FreqChar) -> Bool {
        if lhs.count < rhs.count {
            return true
        } else if lhs.count == rhs.count {
            return lhs.char < rhs.char
        }
        return false
    }
}

func reorganizeString( _ s: String) -> String {
    var heap = Heap<FreqChar>()
    var occurences : [Character:Int] = s.reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }
    
    for (key, value) in occurences {
        heap.insert(FreqChar(char: key, count: value))
    }
    
    guard !heap.isEmpty else { return "" }
    var result = ""
    var currentLargest = heap.removeMax()
    appendIntoResultAndReInsertIntoHeap(&result, &currentLargest, &heap)
    
    while !heap.isEmpty {
        var currentLargest = heap.removeMax()
        if let prev = result.last , prev == currentLargest.char {
            if heap.isEmpty { return "" }
            var next = heap.removeMax()
            appendIntoResultAndReInsertIntoHeap(&result, &next, &heap)
            heap.insert(currentLargest)
            
        } else {
            appendIntoResultAndReInsertIntoHeap(&result, &currentLargest, &heap)
        }
    }
    return result
}

func appendIntoResultAndReInsertIntoHeap(_ result: inout String, _ element: inout FreqChar, _ heap: inout Heap<FreqChar>) {
    result.append(element.char)
    element.count -= 1
    if element.count > 0 {
        heap.insert(element)
    }
}

/*
 struct FreqChar: Comparable {
 let char: Character
 var count: Int
 
 static func <(lhs: FreqChar, rhs: FreqChar) -> Bool {
 if lhs.count < rhs.count {
 return true
 } else if lhs.count == rhs.count {
 return lhs.char < rhs.char
 }
 return false
 }
 }
 
 func reorganizeString(_ s: String) -> String {
 var heap = Heap<FreqChar>()
 var occurences = [Character: Int]()
 for char in s {
 occurences[char, default: 0] += 1
 }
 
 for (key, value) in occurences {
 heap.insert(
 FreqChar(char: key, count: value)
 )
 }
 
 var result = ""
 guard !heap.isEmpty else {
 return ""
 }
 var currentLargest = heap.removeMax()
 appendCurrentLargestAndReInsertInHeap(&result,
 &currentLargest,
 &heap)
 
 while !heap.isEmpty {
 var currentLargest = heap.removeMax()
 
 if let prev = result.last, prev == currentLargest.char {
 if heap.isEmpty { return "" }
 var next = heap.removeMax()
 appendCurrentLargestAndReInsertInHeap(&result,
 &next,
 &heap)
 heap.insert(currentLargest)
 } else {
 appendCurrentLargestAndReInsertInHeap(&result,
 &currentLargest,
 &heap)
 }
 }
 return result
 }
 
 func appendCurrentLargestAndReInsertInHeap(_ result: inout String,
 _ currentLargest: inout FreqChar,
 _ heap: inout Heap<FreqChar> ){
 result.append(currentLargest.char)
 currentLargest.count -= 1
 if currentLargest.count > 0 {
 heap.insert(currentLargest)
 }
 }
 */
