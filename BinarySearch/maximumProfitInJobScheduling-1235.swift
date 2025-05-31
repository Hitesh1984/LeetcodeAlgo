//
//  maximumProfitInJobScheduling-1235.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/15/25.
/*
 https://leetcode.com/problems/maximum-profit-in-job-scheduling/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 We have n jobs, where every job is scheduled to be done from startTime[i] to endTime[i], obtaining a profit of profit[i].
 
 You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.
 
 If you choose a job that ends at time X you will be able to start another job that starts at time X.
 
 
 
 Example 1:
 
 
 
 Input: startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
 Output: 120
 Explanation: The subset chosen is the first and fourth job.
 Time range [1-3]+[3-6] , we get profit of 120 = 50 + 70.
 Example 2:
 
 
 
 Input: startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
 Output: 150
 Explanation: The subset chosen is the first, fourth and fifth job.
 Profit obtained 150 = 20 + 70 + 60.
 Example 3:
 
 
 
 Input: startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4]
 Output: 6
 
 
 Constraints:
 
 1 <= startTime.length == endTime.length == profit.length <= 5 * 104
 1 <= startTime[i] < endTime[i] <= 109
 1 <= profit[i] <= 104
 
 */

import Foundation

public extension RandomAccessCollection {
    /// Finds such index N that predicate is true for all elements up to
    /// but not including the index N, and is false for all elements
    /// starting with index N.
    /// Behavior is undefined if there is no such N.
    func binarySearch(predicate: (Element) -> Bool) -> Index {
        var low = startIndex
        var high = endIndex
        while low != high {
            let mid = index(low, offsetBy: distance(from: low, to: high) / 2)
            if predicate(self[mid]) {
                low = index(after: mid)
            } else {
                high = mid
            }
        }
        return low
    }
}




// startTime -  [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    let n = startTime.count
    
    // Sort the indices based on the corresponding startTime and endTime values.
    let jobsByStartTime = startTime.indices.sorted { startTime[$0] < startTime[$1] }
    let jobsByEndTime = endTime.indices.sorted { endTime[$0] < endTime[$1] }
    
    // Build a map to find the last ended job for any given job's start time.
    var last = -1
    var lastFinishedJob = Array(repeating: -1, count: n)
    for index in jobsByStartTime {
        // Skip all the end times that are smaller than the start time.
        while startTime[index] >= endTime[jobsByEndTime[last + 1]] {
            last += 1
        }
        
        // No job ends before this job starts.
        lastFinishedJob[index] = last >= 0 ? jobsByEndTime[last] : -1
    }
    
    var answerSoFar = 0
    // Dynamic programming table to store the maximum profit at each end time index.
    var dp = Array(repeating: 0, count: n)
    
    // Iterate through jobs sorted by end time.
    for index in jobsByEndTime {
        // Find the last ended job's end time index for the current job's start time.
        let lastEndIndex = lastFinishedJob[index]
        
        // Update the maximum profit for the current end time index.
        let profitBeforeStart = lastEndIndex != -1 ? dp[lastEndIndex] : 0
        answerSoFar = max(answerSoFar, profitBeforeStart + profit[index])
        dp[index] = answerSoFar
    }
    
    return answerSoFar
}

/*
 
struct Job {
     let startTime: Int
     let endTime: Int
     let profit: Int
}

func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    let indices = startTime.indices
    //: sort jobs by their `endTime`s
    let jobs = indices
        .map { i in Job(startTime: startTime[i], endTime: endTime[i], profit: profit[i]) }
        .sorted { $0.endTime < $1.endTime }
    //: for each job, find the last job that does not overlap it
    let previous = indices
        .map { i in indices.binarySearch(predicate: { j in jobs[j].endTime <= jobs[i].startTime }) }
    
    var dp = [Int](repeating: 0, count: indices.count + 1)
    for i in 1..<startTime.count + 1 {
        dp[i] = max(dp[i - 1], jobs[i - 1].profit + dp[previous[i - 1]]) //: take or not take
    }
    return dp.last!
}
*/
