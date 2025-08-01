//
//  BoatsToSavePeople-881.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/boats-to-save-people/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit.

 Return the minimum number of boats to carry every given person.

  

 Example 1:

 Input: people = [1,2], limit = 3
 Output: 1
 Explanation: 1 boat (1, 2)
 Example 2:

 Input: people = [3,2,2,1], limit = 3
 Output: 3
 Explanation: 3 boats (1, 2), (2) and (3)
 Example 3:

 Input: people = [3,5,3,4], limit = 5
 Output: 4
 Explanation: 4 boats (3), (3), (4), (5)
  

 Constraints:

 1 <= people.length <= 5 * 104
 1 <= people[i] <= limit <= 3 * 104

 */

func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
    var people = people.sorted()
    var res = 0
    var l = 0
    var r = people.count - 1
    while l <= r {
        var remain = limit - people[r]
        r -= 1
        if l <= r && remain >= people[l] {
            l += 1
        }
        res += 1
    }
    return res
}
