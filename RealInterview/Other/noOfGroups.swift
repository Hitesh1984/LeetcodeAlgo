//
//  noOfGroups.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/8/25.

/*
Relationships between people may be represented in a matrix as a series of binary digits. For example, the direct relationships for person 0 with persons 0 through 5 might be shown as 101100. This means that person 0 knows persons 0, 2 and 3, the indices of each of the 1 values. A relationship is transitive. In other words, if person 0 knows person 2 and person 2 knows person 3, then person 0 knows person 3 through person 2. A group is composed of all of the people who know one another, whether directly or transitively.

Example:

Consider the following relationships matrix:

Person 0: 1100
Person 1: 1110
Person 2: 0110
Person 3: 0001

Persons 0 and 1 know each other, while person 1 knows 2. Person 3 does not know anyone. Thus there are 2 groups.

Complete the function countGroups which determines the number of groups represented in a matrix.

countGroups has the following parameter(s):

 related:[[Int]]  an array of an array of binary digits related[i] that represent connections of people

Returns:
int: an integer that represents the number of groups of people
*/


import Foundation

func getGroups(_ matrix:[[Int]]) -> Int {
    var map = [Int:[Int]]()
    for (ind,arr) in matrix.enumerated(){
        var parentKey = Int.max
        var temp = [Int]()
        for (ind2,val2) in arr.enumerated()  {
            if ( val2 == 1){
                temp.append(ind2)
            }
            if(ind2 == (arr.count-1)) {
                for key in map.keys {
                    if (map[key, default: []].contains( where: {temp.contains($0) })) {
                        parentKey = key
                    }
                    break
                }
                if parentKey == Int.max {
                    parentKey = ind
                }
                for obj in temp {
                    if (!map[parentKey, default: []].contains(obj)) {
                        map[parentKey, default: []].append(obj)
                    }
                }
                temp.removeAll()
            }
        }
    }
    //print(map)
    return map.keys.count
}


