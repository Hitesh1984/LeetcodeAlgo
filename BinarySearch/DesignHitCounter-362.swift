//
//  DesignHitCounter-362.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/31/25.
/*
 https://leetcode.com/problems/design-hit-counter/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Design a hit counter which counts the number of hits received in the past 5 minutes (i.e., the past 300 seconds).

 Your system should accept a timestamp parameter (in seconds granularity), and you may assume that calls are being made to the system in chronological order (i.e., timestamp is monotonically increasing). Several hits may arrive roughly at the same time.

 Implement the HitCounter class:

 HitCounter() Initializes the object of the hit counter system.
 void hit(int timestamp) Records a hit that happened at timestamp (in seconds). Several hits may happen at the same timestamp.
 int getHits(int timestamp) Returns the number of hits in the past 5 minutes from timestamp (i.e., the past 300 seconds).
  

 Example 1:

 Input
 ["HitCounter", "hit", "hit", "hit", "getHits", "hit", "getHits", "getHits"]
 [[], [1], [2], [3], [4], [300], [300], [301]]
 Output
 [null, null, null, null, 3, null, 4, 3]

 Explanation
 HitCounter hitCounter = new HitCounter();
 hitCounter.hit(1);       // hit at timestamp 1.
 hitCounter.hit(2);       // hit at timestamp 2.
 hitCounter.hit(3);       // hit at timestamp 3.
 hitCounter.getHits(4);   // get hits at timestamp 4, return 3.
 hitCounter.hit(300);     // hit at timestamp 300.
 hitCounter.getHits(300); // get hits at timestamp 300, return 4.
 hitCounter.getHits(301); // get hits at timestamp 301, return 3.
  

 Constraints:

 1 <= timestamp <= 2 * 109
 All the calls are being made to the system in chronological order (i.e., timestamp is monotonically increasing).
 At most 300 calls will be made to hit and getHits.

 */

class HitCounter {

    var hits: [Int]

    init() {
        self.hits = [Int]()
    }
    
    func hit(_ timestamp: Int) {
        hits.append(timestamp)
    }

    func isBefore(_ i: Int, _ t: Int) -> Bool {
        return hits[i] < t - 299
    }
    
    func getHits(_ timestamp: Int) -> Int {
        var left = 0
        var right = hits.count // right is exclusive

        while left < right {
            var middle = left + (right - left) / 2
            if isBefore(middle, timestamp) {
                left = middle + 1
            } else {
                right = middle
            }
        }

        return hits.count - left // from first valid hit to the end
    }
}
