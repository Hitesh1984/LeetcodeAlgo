/*
 https://leetcode.com/problems/meeting-rooms/description/

 Given an array of meeting time intervals where intervals[i] = [starti, endi], determine if a person could attend all meetings.

  

 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: false
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: true
  

 Constraints:

 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti < endi <= 106

*/

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.count == 0 {
        return true
    }

    //print("intervals \(intervals)")

    let sorted = intervals.sorted { $0[0] < $1[0]}

    //print("Sorted \(sorted)") // [1, 13], [13, 15]

    var previousEnd = sorted[0][1] // 13
    var previousStart = sorted[0][1] // 13
    for i in 1..<sorted.count {

        let currentStart = sorted[i][0] //13
        let currentEnd = sorted[i][1] // 15

        if previousStart <= currentStart && previousEnd <= currentStart {
            previousEnd = currentEnd
            previousStart = currentStart
        } else {
            return false
        }
        
    }
    
    return true
}

/*
let result = canAttendAllMeetings(intervals: [[0,30], [5,10],[7,20], [8,30]])
print(result)

let result2 = canAttendAllMeetings(intervals:  [[7,10], [2,4]])
print(result2)
*/

