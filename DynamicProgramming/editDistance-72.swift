//
//  editDistance.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/7/25.
//

import Foundation

/*
 https://leetcode.com/problems/edit-distance/description/
 
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

 You have the following three operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
  

 Example 1:

 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:

 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
  

 Constraints:

 0 <= word1.length, word2.length <= 500
 word1 and word2 consist of lowercase English letters.

 */


func minDistance(_ word1: String, _ word2: String) -> Int
{
    let lengthWord1 = word1.count
    let lengthWord2 = word2.count
    if lengthWord1 == 0 || lengthWord2 == 0 {
        return max(0,
                   lengthWord1,
                   lengthWord2)
    }
    var grid:Matrix<Int> = Matrix(rows: lengthWord1+1,
                                  columns: lengthWord2+1,
                                  defaultValue: 0)
    for col in 0...lengthWord2 {
        grid[0, col] = col
    }
    for i in 1...lengthWord1 {
        grid[i,0] = i
        for j in 1...lengthWord2 {
            if word1[i-1] == word2[j-1] {
                grid[i,j] = grid[i-1,j-1]
            } else {
                grid[i,j] = min(grid[i-1,j-1],
                                grid[i-1,j],
                                grid[i,j-1]) + 1
            }
        }
    }
    return grid[lengthWord1,lengthWord2]
}
