//
//  TopKFrequentWords-692.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/1/25.

/*
 https://leetcode.com/problems/top-k-frequent-words/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of strings words and an integer k, return the k most frequent strings.

 Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.

  

 Example 1:

 Input: words = ["i","love","leetcode","i","love","coding"], k = 2
 Output: ["i","love"]
 Explanation: "i" and "love" are the two most frequent words.
 Note that "i" comes before "love" due to a lower alphabetical order.
 Example 2:

 Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
 Output: ["the","is","sunny","day"]
 Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.
  

 Constraints:

 1 <= words.length <= 500
 1 <= words[i].length <= 10
 words[i] consists of lowercase English letters.
 k is in the range [1, The number of unique words[i]]
  
 */

import Collections

struct Info:Comparable {
    let word: String
    let freq: Int
    
    static func < (lhs: Info, rhs:Info) -> Bool {
        if rhs.freq == lhs.freq {
            return lhs.word > rhs.word
        } else {
            return lhs.freq < rhs.freq
        }
    }
}

func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    var has = words.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap<Info>()
    var common = [String]()
    for (key, value) in has {
        heap.insert(Info(word: key, freq: value))
    }
    var k = k
    while k > 0 && !heap.isEmpty {
        common.append(heap.popMax()!.word)
        k -= 1
    }
    return common
}

