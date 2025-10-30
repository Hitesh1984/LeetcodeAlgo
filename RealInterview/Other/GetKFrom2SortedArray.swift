/*
 https://leetcode.com/discuss/post/351782/google-phone-screen-kth-largest-element-cx45o/
 
 Example 1:

 Input: nums1 = [-2, -1, 3, 5, 6, 8], nums2 = [0, 1, 2, 5, 9], k = 4
 Output: 5
 Explanation: Union of above arrays will be [-2, -1, 0, 1, 2, 3, 5, 5, 6, 8, 9] and the 4th largest element is 5.
 Example 2:

 Input: nums1 = [2, 4], nums2 = [6], k = 1
 Output: 6
 Explanation: union of above arrays will be [2, 4, 6] and the 1st largest element is 6.
 You may assume k is always valid, 1 ≤ k ≤ m + n.
 */

func getKthFromTwoSortedArray(first:[Int], second: [Int], k: Int) -> Int {

    if first.count + second.count <= k-1 {
        return -1
    }
    if k < 0 {
        return -1
    }

    var iteration = 0
    var firstIndex = 0
    var secondIndex = 0 

    while(iteration < k) {
      
        if firstIndex >= first.count {
           let left = k - firstIndex - secondIndex
           return second[secondIndex+left-1]
        } 
        
        if secondIndex >= second.count  {
          let left = k - firstIndex - secondIndex 
          return first[firstIndex+left-1]
          
        }

        if first[firstIndex] < second[secondIndex] {
           iteration = iteration + 1
            if k == iteration {
                return first[firstIndex]
            }
            firstIndex = firstIndex + 1
        }
        else {
             iteration = iteration + 1
            if k == iteration {
                return second[secondIndex]
            }
            secondIndex = secondIndex + 1
        }
    }

    return -1
}

/*
let val1 = getKthFromTwoSortedArray(first:[], second:[], k: 5) 
let val2 = getKthFromTwoSortedArray(first:[], second:[2,3,4,5], k: 5) 
let val3 = getKthFromTwoSortedArray(first:[], second:[1,2,3,4,5], k: 5) 

let val4 = getKthFromTwoSortedArray(first:[], second:[], k: 5) 
let val5 = getKthFromTwoSortedArray(first:[2,3,4,5], second:[], k: 5) 
let val6 = getKthFromTwoSortedArray(first:[1,2,3,4,5], second:[], k: 5) 

let val7 = getKthFromTwoSortedArray(first:[2,3,4,8], second:[2,3,5,7], k: 8) 
let val8 = getKthFromTwoSortedArray(first:[2,3,4,5], second:[2,3,4,5], k: 9) 
let val9 = getKthFromTwoSortedArray(first:[2,3,4,5], second:[2,3,4,5], k: 7) 

let val10 = getKthFromTwoSortedArray(first:[1,3,5,7], second:[2,4,6,8,10,12], k: 9) 

let val11 = getKthFromTwoSortedArray(first:[2,3,4,5], second:[2,3,4,5], k: -1) 



 print(val1)
 print(val2)
 print(val3)

 print(val4)
 print(val5)
 print(val6)

print(val7)
print(val8)
print(val9)
print(val10)
print(val11)

 

Input for the program ( Optional )
STDIN
Output:

-1
-1
5
-1
-1
5
8
-1
5
10
-1
*/
