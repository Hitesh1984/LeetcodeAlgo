//
//  mergeTwounSortedArrayWithoutRepeating.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/22/25.
//

import Foundation

func mergeArray(_ first: [Int], _ second:[Int]) -> [Int] {

    var map = Set<Int>()
    for val in first {
        map.insert(val)
    }
     for val in second {
        map.insert(val)
    }
    var ret = [Int]()
    for key in map {
        ret.append(key)
    }
    return ret
}

/*
let ans = mergeArray([1,2,3,3,2,1,5], [7, 8, 1,2,3,3,2,1,5])
print(ans)
*/
