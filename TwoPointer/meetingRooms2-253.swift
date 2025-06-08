/*
 
 https://leetcode.com/problems/meeting-rooms-ii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

  

 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: 1
  

 Constraints:

 1 <= intervals.length <= 104
 0 <= starti < endi <= 106

*/

func minMeetingRooms(intervals : [[Int]]) -> Int {
    if intervals.count == 0 {
        return 0
    }
    var startTimes = [Int]()
    var endTimes = [Int]()
    for i in 0..<intervals.count {
        startTimes.append(intervals[i][0])
        endTimes.append(intervals[i][1])
    }
    startTimes.sort()
    endTimes.sort()

    var start = 0
    var end = 0
    var numberOfRooms = 0
    //[[0,30], [5,10],[10,20], [21,35], [31,35]]
    // start 0, 5, 10, 21, 31
    // end 10,20,30, 35,35
    while start < intervals.count {

        let sTime = startTimes[start]
        let eTime = endTimes[end]
        if sTime >= eTime {
            numberOfRooms -= 1
            end += 1
        }
        start += 1
        numberOfRooms += 1 // 1
        
    }
    return numberOfRooms
}
/*

*/

