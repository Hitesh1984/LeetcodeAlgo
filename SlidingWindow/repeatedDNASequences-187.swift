//
//  repeatedDNASequences-187.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/repeated-dna-sequences/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.

 For example, "ACGAATTCCG" is a DNA sequence.
 When studying DNA, it is useful to identify repeated sequences within the DNA.

 Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

  

 Example 1:

 Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 Output: ["AAAAACCCCC","CCCCCAAAAA"]
 Example 2:

 Input: s = "AAAAAAAAAAAAA"
 Output: ["AAAAAAAAAA"]
  

 Constraints:

 1 <= s.length <= 105
 s[i] is either 'A', 'C', 'G', or 'T'.

 */

func findRepeatedDnaSequences(_ s: String) -> [String] {
    if s.count < 10 { return [] }
    
    let start = s.startIndex
    var seq = String(s[start...s.index(start, offsetBy: 9)])
    var unique = Set<String>()
    unique.insert(seq)
    let arr = Array(s)
    var res = [String]()
    for i in 10..<s.count {
        seq.removeFirst()
        seq.append(arr[i])
        if res.contains(seq) { continue }
        if unique.contains(seq) {
            res.append(seq)
            unique.remove(seq)
            continue
        }
        unique.insert(seq)
    }
    return res
}

