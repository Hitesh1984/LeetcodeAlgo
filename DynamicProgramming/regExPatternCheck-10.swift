//
//  regExPatternCheck.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 12/23/23.
//
/*
 https://leetcode.com/problems/regular-expression-matching/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).

  

 Example 1:

 Input: s = "aa", p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input: s = "aa", p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:

 Input: s = "ab", p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
  

 Constraints:

 1 <= s.length <= 20
 1 <= p.length <= 20
 s contains only lowercase English letters.
 p contains only lowercase English letters, '.', and '*'.
 It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
 */


/*
 approach:-
 
 if str[i] == pattern[j] || pattern[j] == "."
 {
    T[i-1][j-1]
 } else if pattern[j] == "*"{
    
        T[i][j-2] OR
        (( ( str[i-1] == pattern[j-2] ) OR (pattern[j-2] == ".") ) && T[i-1,j] )
 }
 
 */

func isMatch(_ s: String, _ p: String) -> Bool {
    let inputStringArrayFormat = Array(s)
    let patternArrayFormat = Array(p)
    let totalRowValue = s.count + 1
    let totalColValue = p.count + 1
    var grid:Matrix<Bool> = Matrix(rows: totalRowValue, columns: totalColValue, defaultValue: false)
//    var grid: [[Bool]] = Array(repeating:Array(repeating: false, count: totalColValue) , count: totalRowValue)
    grid[0,0] = true
    //grid[0][0] = true
    
    for row in stride(from: 0, through: (totalRowValue-1), by: 1)
    {
        for col in stride(from: 1, through: (totalColValue-1), by: 1)
        {
            let patternChar = patternArrayFormat[col-1]
            if(patternChar == "*" ) {
//                grid[row][col] = grid[row][col-2] || (row > 0 && inputStringArrayFormat[row-1] == patternArrayFormat[col-2] || patternArrayFormat[col-2] == ".") && grid[row-1][col]
                grid[row,col] = grid[row,col-2] || (row > 0 && (inputStringArrayFormat[row-1] == patternArrayFormat[col-2] || patternArrayFormat[col-2] == ".") && grid[row-1,col])
            }
            else{
                grid[row,col] = row > 0 &&
                grid[row-1,col-1] &&
                (inputStringArrayFormat[row-1] == patternArrayFormat[col-1] || patternArrayFormat[col-1] == ".")
                
//                grid[row][col] = row > 0 && grid[row-1][col-1] && (inputStringArrayFormat[row-1] == patternArrayFormat[col-1] || patternArrayFormat[col-1] == ".")
            }
            
        }
    }
    return grid[(totalRowValue-1),(totalColValue-1)]
    //return grid[(totalRowValue-1)][(totalColValue-1)]
}

func RegexPatternWithDot(inputString:String, pattern:String) -> Bool
{
    let inputStringArrayFormat = Array(inputString)
    let patternArrayFormat = Array(pattern)
    let totalRowValue = inputString.count + 1
    let totalColValue = pattern.count + 1
    var grid:Matrix<Bool> = Matrix(rows: totalRowValue, columns: totalColValue, defaultValue: false)
    grid[0,0] = true
    
    for row in stride(from: 0, through: (totalRowValue-1), by: 1)
    {
        for col in stride(from: 1, through: (totalColValue-1), by: 1)
        {
            let patternChar = patternArrayFormat[col-1]
            if(patternChar == "*" ) {
                grid[row,col] = grid[row,col-2] || (row > 0 && (inputStringArrayFormat[row-1] == patternArrayFormat[col-2] || patternArrayFormat[col-2] == ".") && grid[row-1,col])
            }
            else{
                grid[row,col] = row > 0 &&
                grid[row-1,col-1] &&
                (inputStringArrayFormat[row-1] == patternArrayFormat[col-1] || patternArrayFormat[col-1] == ".")
            }
            
        }
    }
    return grid[(totalRowValue-1),(totalColValue-1)]
}

func RegexPatternWith(inputString:String, pattern:String) -> Bool
{
    let totalRowValue = inputString.count + 1
    let totalColValue = pattern.count + 1
    var grid:Matrix<Bool> = Matrix(rows: totalRowValue,
                                   columns: totalColValue,
                                   defaultValue: false)
    grid[0,0] = true
    for row in stride(from: 0, through: (totalRowValue-1), by: 1)
    {
        for col in stride(from: 1, through: (totalColValue-1), by: 1)
        {
            let patternChar = pattern[col-1]
            if(patternChar == "*" ) {
                grid[row,col] = grid[row,col-2] || (row > 0 && (inputString[row-1] == pattern[col-2] || pattern[col-2] == ".") && grid[row-1,col])
            }
            else{
                grid[row,col] = row > 0 &&
                grid[row-1,col-1] &&
                (inputString[row-1] == pattern[col-1] || pattern[col-1] == ".")
            }
            
        }
    }
    return grid[(totalRowValue-1),(totalColValue-1)]
}


