//
//  friendOfAppropriateAge-825.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/25/25.
/*
 https://leetcode.com/problems/friends-of-appropriate-ages/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 There are n persons on a social media website. You are given an integer array ages where ages[i] is the age of the ith person.

 A Person x will not send a friend request to a person y (x != y) if any of the following conditions is true:

 age[y] <= 0.5 * age[x] + 7
 age[y] > age[x]
 age[y] > 100 && age[x] < 100
 Otherwise, x will send a friend request to y.

 Note that if x sends a request to y, y will not necessarily send a request to x. Also, a person will not send a friend request to themself.

 Return the total number of friend requests made.

  

 Example 1:

 Input: ages = [16,16]
 Output: 2
 Explanation: 2 people friend request each other.
 Example 2:

 Input: ages = [16,17,18]
 Output: 2
 Explanation: Friend requests are made 17 -> 16, 18 -> 17.
 Example 3:

 Input: ages = [20,30,100,110,120]
 Output: 3
 Explanation: Friend requests are made 110 -> 100, 120 -> 110, 120 -> 100.
  

 Constraints:

 n == ages.length
 1 <= n <= 2 * 104
 1 <= ages[i] <= 120
 
 */

func numFriendRequests(_ ages: [Int]) -> Int {
    var ageCount = [Int](repeating: 0, count: 121)
    var result = 0
    
    // Count each age
    for age in ages {
        ageCount[age] += 1
    }
    
    // Calculate friend requests
    for age in 1...120 {
        if ageCount[age] > 0 {
            let minAge = max(Int(0.5 * Double(age) + 7) + 1, 1)
            if minAge <= age {
                for friendAge in minAge...age {
                    if ageCount[friendAge] > 0 {
                        // Add requests except self-requests if same age
                        if age == friendAge {
                            result += ageCount[age] * (ageCount[friendAge] - 1)
                        } else {
                            result += ageCount[age] * ageCount[friendAge]
                        }
                    }
                }
            }
        }
    }
    
    return result
}
