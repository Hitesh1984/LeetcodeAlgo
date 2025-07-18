//
//  zigazgConversion-6.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/6/25.

/*
 https://leetcode.com/problems/zigzag-conversion/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:

 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:

 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000

 */

func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else { return s }
    var lines = Array(repeating: "", count: numRows)
    for (i, c) in s.enumerated() {
        let index = i % (numRows + numRows - 2)
        if index < numRows {
            lines[index].append(c)
        } else {
            let ind = 2 * numRows - index - 2
            lines[ind].append(c)
        }
    }
    return lines.joined()
}
