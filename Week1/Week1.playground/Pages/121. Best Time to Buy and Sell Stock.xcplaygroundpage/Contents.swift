//: [← Previous: 217. Contains Duplicate](@previous)
//:
//: # 121. Best Time to Buy and Sell Stock
//: [LeetCode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
//:
//: You are given an array `prices` where `prices[i]` is the price of a given stock on the ith day.
//:
//: You want to maximize your profit by choosing a **single day** to buy one stock and choosing a **different day in the future** to sell that stock.
//:
//: Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return `0`.
//:
//: **Example 1:**
//: - Input: `prices = [7,1,5,3,6,4]`
//: - Output: `5`
//: - Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//: - Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
//:
//: **Example 2:**
//: - Input: `prices = [7,6,4,3,1]`
//: - Output: `0`
//: - Explanation: In this case, no transactions are done and the max profit = 0.
//:
//: **Constraints:**
//: - `1 <= prices.length <= 10^5`
//: - `0 <= prices[i] <= 10^4`

import Foundation

// MARK: - Solution

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = prices[0]
        
        for price in prices {
            maxProfit = max(maxProfit, price - minPrice)
            minPrice = min(minPrice, price)
        }
        
        return maxProfit
    }
}

// MARK: - Test Cases

let solution = Solution()
print(solution.maxProfit([7,1,6,5,4,3]))
assert(solution.maxProfit([7,1,5,3,6,4]) == 5,  "Test 1 Failed")
assert(solution.maxProfit([7,6,4,3,1]) == 0, "Test 2 Failed")
assert(solution.maxProfit([2,4,1]) == 2, "Test 3 Failed")
assert(solution.maxProfit([3,2,6,5,0,3]) == 4, "Test 4 Failed")
assert(solution.maxProfit([1]) == 0, "Test 5 Failed")
assert(solution.maxProfit([1,2]) == 1, "Test 6 Failed")

print("All test cases passed! ✅")

//: [Next → 242. Valid Anagram](@next)
