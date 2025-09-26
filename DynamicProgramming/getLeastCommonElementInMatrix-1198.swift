//
//  getLeastCommonElementInMatrix.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/26/25.
//

import Foundation


/*
 
 https://docs.vultr.com/problem-set/find-smallest-common-element-in-all-rows
 
 https://algo.monster/liteproblems/1198
 
 https://leetcode.com/problems/find-smallest-common-element-in-all-rows/description/
 
 
 Given a matrix where every row is sorted in increasing order, return the smallest common element in all rows. If there is no common element return -1.
 
 Example 1
 
 i/p:- [[1,2,3,4,5],[2,4,5,8,10],[3,5,7,9,11],[1,3,5,7,9]]
 
 o/p :- 5
 
 
 Example 2:
 
 i/p:  [[1,2,3],[2,3,4],[2,3,5]]
 o/p:- 2
 
 */


/*
 
 let letterCount = letters.reduce(into: [:]) { counts, letter in
 ///         counts[letter, default: 0] += 1
 ///     }
 ///     // letterCount == ["a": 5, "b": 2, "r": 2, "c": 1, "d": 1]
 ///
 */

func getLeastCommonElement(_ input: [[Int]]) -> Int {
    
    if input.count == 0 {
        return -1
    }
    var elementGroup = [Int:[Int]]()
    
    func isContainingAllGroup(groups:[Int], tillAllGroup:Int) -> Bool {
        for index in 0...tillAllGroup {
            if !groups.contains(index) {
                return false
            }
        }
        return true
        
    }

    for (index,insideArray) in input.enumerated() {
        for element in insideArray {
            if let _ = elementGroup[element] {
                elementGroup[element]?.append(index)
            } else {
                elementGroup[element] = [index]
            }
            if(index == input.count - 1) {
                if let elementGroupArray = elementGroup[element], isContainingAllGroup(groups: elementGroupArray, tillAllGroup: index) {
                    return element
                }
            }
        }
    }
    return -1
}





/*
func getLeastCommonElement(_ input: [[Int]]) -> Int {
    
    if input.count == 0 {
        return -1
    }
    var hashMap = [Int:Int]()
    for insideArray in input {
        for element in insideArray {
            if let count = hashMap[element] {
                hashMap[element] = count + 1
            } else {
                hashMap[element] = 1
            }
            if hashMap[element] == input.count {
                return element
            }
        }
    }
    return -1
}
*/
/*
func getLeastCommonElement(_ input: [[Int]]) -> Int {
    
    if input.count == 0 {
        return -1
    }
    var hashMap = [Int:Int]()
    var commonElements = [Int:[Int]]()
    var maxFrequency = 0
    
    for insideArray in input {
        for element in insideArray {
            
            if let count = hashMap[element] {
                hashMap[element] = count + 1
            } else {
                hashMap[element] = 1
            }
        }
    }
    for value in hashMap.keys {
        let cnt = hashMap[value]!
        if cnt > maxFrequency {
            commonElements.removeAll()
            commonElements[cnt] = [value]
            maxFrequency = cnt
        }else if cnt == maxFrequency {
            if let _ = commonElements[cnt] {
                commonElements[cnt]?.append(value)
            } else {
                commonElements[cnt] = [value]
            }
        }
    }
    return commonElements[maxFrequency]?.sorted().first ?? -1
}
*/
