//
//  sortCharactersByFrequency-451.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/10/25.

/*
 https://leetcode.com/problems/sort-characters-by-frequency/description/
 
 Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

 Return the sorted string. If there are multiple answers, return any of them.

  

 Example 1:

 Input: s = "tree"
 Output: "eert"
 Explanation: 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:

 Input: s = "cccaaa"
 Output: "aaaccc"
 Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:

 Input: s = "Aabb"
 Output: "bbAa"
 Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
  

 Constraints:

 1 <= s.length <= 5 * 105
 s consists of uppercase and lowercase English letters and digits.

 */

import Collections

struct CharCounter:Comparable {
    let char:Character
    let freq:Int
    static func < (lhs:CharCounter, rhs:CharCounter) -> Bool {
        lhs.freq < rhs.freq
    }
}

func frequencySort(_ s: String) -> String {
    var freq: [Character: Int] = [:]
    for c in s {
        freq[c, default: 0] += 1
    }
    var heap:Heap<CharCounter> = []
    for(char, freq) in freq {
        heap.insert(CharCounter(char: char, freq: freq))
    }
    freq.removeAll()
    var result = ""
    while !heap.isEmpty {
        let charCounter = heap.popMax()!
        result +=  String(repeating:charCounter.char , count:charCounter.freq)
    }
    return result
}

func frequencySort2(_ s: String) -> String {
    var freq: [Character: Int] = [:]
    for c in s {
        freq[c, default: 0] += 1
    }
    let freqSorted = freq.sorted { $0.value > $1.value }
    var result = ""
    for (char,count) in freqSorted {
        result +=  String(repeating:char , count:count)
    }
    return result
}


