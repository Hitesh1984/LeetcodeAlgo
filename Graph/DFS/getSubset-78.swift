//
//  getSubset.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/18/25.
//

import Foundation

func getSubsetof(input:[Int]) -> [[Int]] {

    var result:[[Int]] = []
    var subset:[Int] = []
    
    func dfs(i:Int) {
        
        if i >= input.count {
            result.append(subset)
            return
        }
        subset.append(input[i])
        dfs(i: i+1)
        
        subset.popLast()
        dfs(i: i+1)
    }
    dfs(i: 0)
    return result
}
