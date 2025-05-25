//
//  minimumOperationToMakeArrayAlternative.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/24/25.
//
/*
 https://leetcode.com/problems/minimum-operations-to-make-the-array-alternating/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given a 0-indexed array nums consisting of n positive integers.

 The array nums is called alternating if:

 nums[i - 2] == nums[i], where 2 <= i <= n - 1.
 nums[i - 1] != nums[i], where 1 <= i <= n - 1.
 In one operation, you can choose an index i and change nums[i] into any positive integer.

 Return the minimum number of operations required to make the array alternating.

  

 Example 1:

 Input: nums = [3,1,3,2,4,3]
 Output: 3
 Explanation:
 One way to make the array alternating is by converting it to [3,1,3,1,3,1].
 The number of operations required in this case is 3.
 It can be proven that it is not possible to make the array alternating in less than 3 operations.
 Example 2:

 Input: nums = [1,2,2,2,2]
 Output: 2
 Explanation:
 One way to make the array alternating is by converting it to [1,2,1,2,1].
 The number of operations required in this case is 2.
 Note that the array cannot be converted to [2,2,2,2,2] because in this case nums[0] == nums[1] which violates the conditions of an alternating array.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 105
 
 */
 /* Test cases 
 let res = minimumOperations([3,1,3,2,4,3])
                            print(res)
                            let res1 = minimumOperations([4,12,91,17,29,2,32,49,5,30,89,21,91,34,71,22,88,32,36,64,28,69,7,100,35,41,62,91,85,61,4,79,77,52,57,97,41,91,13,34,37,84,10,10,37,93,58,35,81,36,81,6,50,27,68])
                                print(res1)
                            let res2 = minimumOperations([3,1,3,2,4,3])
                            print(res2)
                let res2 = minimumOperations([1,2,2,2,2])
                print(res2)
                let res2 = minimumOperations([2,2,2,2])
                print(res2)
                let res3 = minimumOperations([4,3,4,3,4,3,3,5,3,5,3,3])
                print(res3)
 */
func minimumOperations(_ nums: [Int]) -> Int {
    var countOperations = 0
    if nums.count == 1 {
        return countOperations
    }
    var evenIndex = [Int: Int]()
    var oddIndex = [Int: Int]()
    for index in nums.indices {
        if index % 2 == 0 {
            evenIndex[nums[index], default: 0] += 1
        } else {
            oddIndex[nums[index], default: 0] += 1
        }
    }
    typealias tuppleNumVal = (first: Int,second:Int)
    
    func getFirstAndSecond(_ number : Int ,
                           _ count: Int ,
                           _ twoMaxCount: inout  tuppleNumVal,
                           _ twoMax: inout tuppleNumVal) {
        if count > twoMaxCount.first {
            twoMax.second = twoMax.first
            twoMax.first = number
            twoMaxCount.second = twoMaxCount.first
            twoMaxCount.first = count
        } else if count > twoMaxCount.second {
            twoMax.second = number
            twoMaxCount.second = count
        }
    }
    var twoMaxForEvenCount: tuppleNumVal = (0,0)
    var twoMaxForEven: tuppleNumVal = (0,0)
    var twoMaxForOddCount: tuppleNumVal = (0,0)
    var twoMaxForOdd: tuppleNumVal = (0,0)
    for (number,count) in evenIndex {
        getFirstAndSecond(number, count, &twoMaxForEvenCount, &twoMaxForEven)
    }
    for (number,count) in oddIndex {
        getFirstAndSecond(number, count, &twoMaxForOddCount, &twoMaxForOdd)
    }
    var evenNumber = twoMaxForEven.first
    var oddNumber = twoMaxForOdd.first
    if evenNumber == oddNumber {
        if (twoMaxForOddCount.first + twoMaxForEvenCount.second) >= (twoMaxForOddCount.second + twoMaxForEvenCount.first) {
            evenNumber = twoMaxForEven.second
            oddNumber = twoMaxForOdd.first
        } else {
            evenNumber = twoMaxForEven.first
            oddNumber = twoMaxForOdd.second
        }
    }
    for index in 0..<nums.count
    {
        if (index % 2 == 0) && (nums[index] != evenNumber) {
            countOperations += 1
        }
        else if (index % 2 == 1) && (nums[index] != oddNumber) {
            countOperations += 1
        }
    }
    return countOperations
}
