//
//  maxSum.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/24/25.
//

import Foundation

func maxSumOfArray(_ nums: [Int]) -> Int {
    var sum = nums[0]
    var max_sum = nums[0]
    if sum < 0 {
        sum = 0
    }
    for index in stride(from:1, through:nums.count-1, by:1)
    {
        sum += nums[index]
        max_sum = max(max_sum,sum)
        if sum < 0 {
            sum = 0
        }
    }
    return max_sum
}

/*
 
 func maxSumOfArray(_ nums: [Int]) -> Int {
     
     var sum = 0
     var max_sum = 0
     
     for index in stride(from:0, through:nums.count-1, by:1)
     {
         if( 0 == index) {
             sum = nums[index]
             max_sum = nums[index]
         } else {
             sum = sum + nums[index]
             max_sum = max(max_sum,sum)
             
         }
         if sum < 0 {
                 sum = 0
             }
     }
     return max_sum
 }


 */
