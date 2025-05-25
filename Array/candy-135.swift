//
//  candy-135.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/26/25.
//

/*
 https://leetcode.com/problems/candy/description/
 
 There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.

  

 Example 1:

 Input: ratings = [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 Example 2:

 Input: ratings = [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
 The third child gets 1 candy because it satisfies the above two conditions.
  

 Constraints:

 n == ratings.length
 1 <= n <= 2 * 104
 0 <= ratings[i] <= 2 * 104
 */

import Foundation

func candy(_ ratings: [Int]) -> Int {
    let count = ratings.count
    var candy = count
    
    var iteration = 1
    while iteration < count {
        
        if ratings[iteration] == ratings[iteration-1] {
            iteration += 1
        }
        var peek = 0
        var deep = 0
        // increasing slope
        while(iteration < count && ratings[iteration] > ratings[iteration-1]) {
            peek += 1
            candy += peek
            iteration += 1
            if( count == iteration ) {
                return candy
            }
        }
        
        // decreasing slope
        while(iteration < count && ratings[iteration] < ratings[iteration-1]) {
            deep += 1
            candy += deep
            iteration += 1
        }
        candy -= min(peek, deep)
    }
    return candy
}
