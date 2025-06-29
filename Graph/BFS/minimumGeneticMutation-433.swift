//
//  minimumGeneticMutation-433.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/7/25.

/*
 https://leetcode.com/problems/minimum-genetic-mutation/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 A gene string can be represented by an 8-character long string, with choices from 'A', 'C', 'G', and 'T'.

 Suppose we need to investigate a mutation from a gene string startGene to a gene string endGene where one mutation is defined as one single character changed in the gene string.

 For example, "AACCGGTT" --> "AACCGGTA" is one mutation.
 There is also a gene bank bank that records all the valid gene mutations. A gene must be in bank to make it a valid gene string.

 Given the two gene strings startGene and endGene and the gene bank bank, return the minimum number of mutations needed to mutate from startGene to endGene. If there is no such a mutation, return -1.

 Note that the starting point is assumed to be valid, so it might not be included in the bank.

  

 Example 1:

 Input: startGene = "AACCGGTT", endGene = "AACCGGTA", bank = ["AACCGGTA"]
 Output: 1
 Example 2:

 Input: startGene = "AACCGGTT", endGene = "AAACGGTA", bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]
 Output: 2
  

 Constraints:

 0 <= bank.length <= 10
 startGene.length == endGene.length == bank[i].length == 8
 startGene, endGene, and bank[i] consist of only the characters ['A', 'C', 'G', 'T'].

 */

func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
    guard bank.contains(end) else { return -1 }
    let chStart = Array(start), chEnd = Array(end)
    let chBank = bank.map({Array($0)})
    var visited = [chStart], queue = [chStart], depth = 0
    while !queue.isEmpty {
        depth += 1
        var nextLvl: [[Character]] = []
        for q in queue {
            for b in chBank where !visited.contains(b) {
                var cnt = 0
                for i in 0..<8 where b[i] != q[i] { cnt += 1 }
                guard cnt == 1 else { continue }
                guard b != chEnd else { return depth }
                visited.append(b)
                nextLvl.append(b)
            }
        }
        queue = nextLvl
    }
    return -1
}
