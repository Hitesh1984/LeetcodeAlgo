//
//  Oleg-N-Dolls.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/19/25.
/*
 
 https://www.chegg.com/homework-help/questions-and-answers/posted-java-need-php-solution-classic-russian-dolls-coding-challenge-russian-dolls-oleg-n--q118313393
 
 
 Oleg has N dolls of various sizes. He can place the smaller dolls inside the larger ones, but dolls of the exact same size cannot be placed inside each other. He needs to find the minimum number of dolls that remain when the maximum number of dolls have been packed. Input The first line of input contains an integer N, representing the number of dolls initially. The second line consists of N space-separated integers representing the size of dolls.

 Constraints

 1 ≤ N ≤ 10*5
 1 ≤ size of doll ≤ 10*5

 Output

 Print an integer representing the minimum number of dolls Oleg has after placing all smaller dolls inside the larger dolls.

 Example #1:

 Input
 4
 2 2 3 3

 Output
 2

 Explanation:

 In order to be left with the minimum number of dolls, Oleg will do the following:

 • Puts doll at index 1 inside doll at index 3 i.e doll of size two in size three.

 • Puts doll at index 2 inside box at index 4 i.e doll of size two in size three

 Now he is left with two dolls of size three which cannot be further placed inside each other. So, the output is 2.

 Example #2

 Input
 6
 1 2 2 3 4 5

 Output
 2

 Explanation:

 Oleg will place dolls at index (1, 2, 4, 5) in the doll at index 6. So, he will remain with two dolls of sizes two and five.


 */

import Foundation

func maxDolls(_ n:Int, doll:[Int]) -> Int {
    let doll = doll.sorted()
    var count = doll.count
    var packedDoll = [Int]()
    for (index,d) in doll.enumerated()  {
        var newInd = index + 1
        while newInd < count &&  d >= doll[newInd] {
            newInd += 1
        }
        while newInd < count && packedDoll.contains(newInd) {
            newInd += 1
        }
        if newInd < count && d < doll[newInd] {
            if let i = packedDoll.firstIndex(of: index) {
                packedDoll.remove(at: i)
            }
            packedDoll.append(newInd) 
        }
    }
    return packedDoll.count
}

func testCases22() {
    let res = maxDolls(6, doll:  [1, 2, 2, 3, 4, 5])
    let res2 = maxDolls(4, doll:  [2, 2, 3, 3])
    let res3 = maxDolls(6, doll: [1, 2, 2, 3, 4, 6])
    let res4 = maxDolls(5, doll: [2, 2, 2, 3, 5])
    let res5 = maxDolls(5, doll: [1, 2, 3, 4, 5])
    print(res) // 2
    print(res2) // 2
    print(res3) // 2
    print(res4) // 2
    print(res5) // 1
}
