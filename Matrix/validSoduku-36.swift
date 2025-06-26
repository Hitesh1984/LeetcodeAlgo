//
//  validSoduku.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/6/25.
//

import Foundation


struct position:Equatable{
    let row:Int
    let col:Int
    let box:Int
    let value:Character
    static func ==(lhs: position, rhs: position) -> Bool {
        return (lhs.row == rhs.row || lhs.col == rhs.col || lhs.box == rhs.box) &&
        lhs.value == rhs.value
    }
}
func isValidSudoku(_ board: [[Character]]) -> Bool {
    var seen = Array<position>()
    
//    for i in board.indices {
//        print(i)
//    }
    
    for i in 0..<9 {
        for j in 0..<9 {
            let currVal = board[i][j]
            if currVal == "." {
                continue
            }
            //let box = ((i/3)*10 + (j/3) )
            //print("i= \(i) , j = \(j), box =  \(box) and value = \(currVal) ")
            let pos = position(row:i, col: j, box: ((i/3)*10 + (j/3) ), value: currVal )
            if seen.contains(pos) {
                return false
            } else {
                seen.append(pos)
            }
        }
    }
    return true
}


/*
 final class Solution {
     func isValidSudoku(_ board: [[Character]]) -> Bool {
         var seen = Set<String>()
         for i in 0..<9 {
             for j in 0..<9 {
                 let currVal = board[i][j]
                 if currVal == "." {
                     continue
                 }
                 let row = "\(currVal) found in row \(i)"
                 let col = "\(currVal) found in col \(j)"
                 let box = "\(currVal) found in box \((i/3)) - \((j/3))"
                 if seen.contains(row) {
                     return false
                 } else {
                     seen.insert(row)
                 }
                 if seen.contains(col) {
                     return false
                 } else {
                     seen.insert(col)
                 }
                 if seen.contains(box) {
                     return false
                 } else {
                     seen.insert(box)
                 }
             }
         }
         return true
     }
 }
 */
