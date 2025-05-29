//
//  primeNumber.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/10/25.
//
/*https://leetcode.com/problems/count-primes/description/
 
 Given an integer n, return the number of prime numbers that are strictly less than n.

  

 Example 1:

 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 Example 2:

 Input: n = 0
 Output: 0
 Example 3:

 Input: n = 1
 Output: 0
  

 Constraints:

 0 <= n <= 5 * 106
 */
import Foundation

func countPrimes(_ number: Int) -> Int {
    var number = number - 1
    if number <= 1 {
        return 0
    }
    
    var primeArray = Array(repeating: true, count: number+1) as [Bool]
    primeArray[1] = false
    primeArray[0] = false
    var primeNumbers = 0
    for p in 2...number where p*p <= number {
        if primeArray[p] {
            for i in stride(from: p*p, through: number, by: p) {
                primeArray[i] = false
            }
        }
    }
    
    for (index, value) in primeArray.enumerated() {
        if(value) {
            primeNumbers += 1
        }
    }
    
    return primeNumbers
}


/* Below is function to get all prime number from 1 to n */

func getPrimeNumberFrom1to(number: Int) -> [Int] {
    if number <= 1 {
        return []
    }
    var primeArray = Array(repeating: true, count: number+1) as [Bool]
    primeArray[1] = false
    primeArray[0] = false
    var primeNumbers = [Int]()
    for p in 2...number where p*p <= number {
        if primeArray[p] {
            for i in stride(from: p*p, through: number, by: p) {
                primeArray[i] = false
            }
        }
    }
    
    for (index, value) in primeArray.enumerated() {
        if(value) {
            primeNumbers.append(index)
        }
    }
    
    return primeNumbers
}

