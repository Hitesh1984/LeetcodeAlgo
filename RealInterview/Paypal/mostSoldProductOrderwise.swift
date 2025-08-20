//
//  mostSoldProductOrderwise.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/18/25.



/*
You are working for a large retailer. We would like to determine what was the product which sold the most, and how many times it was sold.

Write a function that takes in a collection of product name strings representing purchases and returns the name of the product with the most purchases, and the total number of sales for that product. If multiple products sold the same amount, return the first to appear in the purchases list. Product names are case insensitive.

Example:
purchases1 = ["Television", "Laptop", "MacBook", "MacBook", "Nintendo Switch"]
findMostSold(inventory1) -> MacBook, 2

purchases2 = ["Blue Shirt", "Red Shirt", "blue pants", "blue shirt", "Red Shirt", "Red Shirt", "blue shirt", "Blue Shirt"]
purchases3 = ["Plushy", "Teddy Bear", "Doll", "Plushy", "Teddy Bear"]
purchases4 = ["Plushy", "Teddy Bear", "Doll", "Doll", "Plushy", "Teddy Bear"]
purchases5 = ["Teddy BeAr", "Plushy", "Doll", "Plushy", "Teddy Bear"]

All Test Cases:
findMostSold(purchases1) -> MacBook, 2
findMostSold(purchases2) -> Blue Shirt, 4
findMostSold(purchases3) -> Plushy, 2
findMostSold(purchases4) -> Plushy, 2
findMostSold(purchases5) -> Teddy Bear, 2

Complexity analysis variables:
P = Number of purchases
(Note: Individual purchase strings have constant length)
*/

import OrderedCollections
func findMostSold(_ input:[String]) -> (String, Int) {
    var map = OrderedDictionary<String, Int>()
    var maxVal = Int.min
    var retPro = ""
    for pro in input {
        map[pro.uppercased(), default:0] += 1
        maxVal = max(maxVal, map[pro.uppercased(), default:0])
    }
    for val in map.keys {
        if map[val.uppercased(), default:0] == maxVal {
            retPro = val
            break
        }
    }
    return (retPro, maxVal)
}

func testCases() {
    let purchases1 = ["Television", "Laptop", "MacBook", "MacBook", "Nintendo Switch"]
    let purchases2 = ["Blue Shirt", "Red Shirt", "blue pants", "blue shirt", "Red Shirt", "Red Shirt", "blue shirt", "Blue Shirt"]
    let purchases3 = ["Plushy", "Teddy Bear", "Doll", "Plushy", "Teddy Bear"]
    let purchases4 = ["Plushy", "Teddy Bear", "Doll", "Doll", "Plushy", "Teddy Bear"]
    let purchases5 = ["Teddy BeAr", "Plushy", "Doll", "Plushy", "Teddy Bear"]
}
