//
//  maximumDishCount.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/10/25.
//

/*
 
 There are
 N
 N dishes in a row on a kaiten belt, with the
 i
 ith dish being of type
 D
 i
 D
 i
 ​    
  . Some dishes may be of the same type as one another.
 You're very hungry, but you'd also like to keep things interesting. The
 N
 N dishes will arrive in front of you, one after another in order, and for each one you'll eat it as long as it isn't the same type as any of the previous
 K
 K dishes you've eaten. You eat very fast, so you can consume a dish before the next one gets to you. Any dishes you choose not to eat as they pass will be eaten by others.
 Determine how many dishes you'll end up eating.
 Please take care to write a solution which runs within the time limit.
 Constraints
 1
 ≤
 N
 ≤
 500
 ,
 000
 1≤N≤500,000
 1
 ≤
 K
 ≤
 N
 1≤K≤N
 1
 ≤
 D
 i
 ≤
 1
 ,
 000
 ,
 000
 1≤D
 i
 ​    
  ≤1,000,000
 Sample test case #1
 N = 6
 D = [1, 2, 3, 3, 2, 1]
 K = 1
 Expected Return Value = 5
 Sample test case #2
 N = 6
 D = [1, 2, 3, 3, 2, 1]
 K = 2
 Expected Return Value = 4
 Sample test case #3
 N = 7
 D = [1, 2, 1, 2, 1, 2, 1]
 K = 2
 Expected Return Value = 2
 Sample Explanation
 In the first case, the dishes have types of
 [
 1
 ,
 2
 ,
 3
 ,
 3
 ,
 2
 ,
 1
 ]
 [1,2,3,3,2,1], so you'll eat the first
 3
 3 dishes, skip the next one as it's another type-
 3
 3 dish, and then eat the last
 2
 2.
 In the second case, you won't eat a dish if it has the same type as either of the previous
 2
 2 dishes you've eaten. After eating the first, second, and third dishes, you'll skip the fourth and fifth dishes as they're each the same type as one of the last
 2
 2 dishes that you've eaten. You'll then eat the last dish, consuming
 4
 4 dishes total.
 In the third case, once you eat the first two dishes you won't eat any of the remaining dishes.
 
 */

import Foundation


func getMaximumEatenDishCount(_ N: Int, _ D: [Int], _ K: Int) -> Int {
  var lastEaten = [Int]()
  lastEaten.reserveCapacity(K)
  var maximumEaten = 0
  for value in D {
      if lastEaten.contains(value) {
        
      } else {
        if lastEaten.count == K {
          lastEaten.removeFirst()
        }
        lastEaten.append(value)
        maximumEaten += 1
      }
  }
  return maximumEaten
}


/*
 
 Note: Chapter 2 is a harder version of this puzzle.
 You're trying to open a lock. The lock comes with a wheel which has the integers from
 1
 1 to
 N
 N arranged in a circle in order around it (with integers
 1
 1 and
 N
 N adjacent to one another). The wheel is initially pointing at
 1
 1.
 For example, the following depicts the lock for
 N
 =
 10
 N=10 (as is presented in the second sample case).

 It takes
 1
 1 second to rotate the wheel by
 1
 1 unit to an adjacent integer in either direction, and it takes no time to select an integer once the wheel is pointing at it.
 The lock will open if you enter a certain code. The code consists of a sequence of
 M
 M integers, the
 i
 ith of which is
 C
 i
 C
 i
 ​    
  . Determine the minimum number of seconds required to select all
 M
 M of the code's integers in order.
 Please take care to write a solution which runs within the time limit.
 Constraints
 3
 ≤
 N
 ≤
 50
 ,
 000
 ,
 000
 3≤N≤50,000,000
 1
 ≤
 M
 ≤
 1
 ,
 000
 1≤M≤1,000
 1
 ≤
 C
 i
 ≤
 N
 1≤C
 i
 ​    
  ≤N
 Sample test case #1
 N = 3
 M = 3
 C = [1, 2, 3]
 Expected Return Value = 2
 Sample test case #2
 N = 10
 M = 4
 C = [9, 4, 4, 8]
 Expected Return Value = 11
 Sample Explanation
 In the first case, there are
 3
 3 integers on the lock, and the sequence of integers to be selected is
 [
 1
 ,
 2
 ,
 3
 ]
 [1,2,3]. One optimal way to enter the code is: select
 1
 1
 →
 → rotate to
 2
 2 (
 1
 1 second)
 →
 → select
 2
 2
 →
 → rotate to
 3
 3 (
 1
 1 second)
 →
 → select
 3
 3. The total time taken is
 1
 +
 1
 =
 2
 1+1=2 seconds.
 In the second case, the lock consists of the integers
 1
 1 through
 10
 10, and the sequence to be selected is
 [
 9
 ,
 4
 ,
 4
 ,
 8
 ]
 [9,4,4,8]. One optimal way to enter the code is: rotate from
 1
 1 backwards to
 9
 9 (
 2
 2 seconds)
 →
 → select
 9
 9
 →
 → rotate forwards to
 4
 4 (
 5
 5 seconds)
 →
 → select
 4
 4 twice
 →
 → rotate forwards to
 8
 8 (
 4
 4 seconds)
 →
 → select
 8
 8. The total time taken is
 2
 +
 5
 +
 4
 =
 11
 2+5+4=11 seconds.
 */

func getMinCodeEntryTime(_ N: Int, _ M: Int, _ C: [Int]) -> Int {
  var totalTime = 0
  for (index,value) in C.enumerated() {
    if(0 == index) {
      totalTime += min(abs(value - 1), abs(N + 1 - value))
    } else {
      totalTime += min(abs(C[index-1] - value) , abs( N + C[index-1] - value))
    }
  }
  return totalTime
}
