//
//  excelSheetColumnNumber-171.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/11/25.
/*
 https://leetcode.com/problems/excel-sheet-column-number/?envType=problem-list-v2&envId=math
 
 Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  

 Example 1:

 Input: columnTitle = "A"
 Output: 1
 Example 2:

 Input: columnTitle = "AB"
 Output: 28
 Example 3:

 Input: columnTitle = "ZY"
 Output: 701
  

 Constraints:

 1 <= columnTitle.length <= 7
 columnTitle consists only of uppercase English letters.
 columnTitle is in the range ["A", "FXSHRXW"].

 */



func titleToNumber(_ columnTitle: String) -> Int {
    var result = 0
    
    for c in columnTitle.unicodeScalars {
        let value = Int(c.value) - 64
        result = (result * 26) + value
    }
    
    return result
}
