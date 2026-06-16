//: [← Previous: 128. Longest Consecutive Sequence](@previous)
//:
//: # 42. Trapping Rain Water
//: [LeetCode](https://leetcode.com/problems/trapping-rain-water/)
//:
//: Given `n` non-negative integers representing an elevation map where the width of each bar is `1`,
//: compute how much water it can trap after raining.
//:
//: **Example 1:** Input: `height = [0,1,0,2,1,0,1,3,2,1,2,1]` → Output: `6`
//: **Example 2:** Input: `height = [4,2,0,3,2,5]` → Output: `9`

import Foundation

// MARK: - Solution

class Solution {
    func trap(_ height: [Int]) -> Int {
        // Write your solution here
        return 0
    }
}

// MARK: - Test Cases

let solution = Solution()

var passed = 0
var failed = [String]()

func check(_ result: Int, _ expected: Int, _ label: String) {
    if result == expected { passed += 1 }
    else { failed.append("\(label) (got \(result), expected \(expected))") }
}

// LeetCode provided examples
check(solution.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6, "TC01 - LeetCode Example 1")
check(solution.trap([4, 2, 0, 3, 2, 5]),                    9, "TC02 - LeetCode Example 2")

// Edge cases
check(solution.trap([]),                                     0, "TC03 - Empty array")
check(solution.trap([1]),                                    0, "TC04 - Single element")
check(solution.trap([1, 2]),                                 0, "TC05 - Two elements, no trap")

// No water trapped
check(solution.trap([1, 2, 3, 4, 5]),                       0, "TC06 - Strictly increasing, no trap")
check(solution.trap([5, 4, 3, 2, 1]),                       0, "TC07 - Strictly decreasing, no trap")

// Simple valleys
check(solution.trap([1, 0, 1]),                              1, "TC08 - Minimal valley, 1 unit")
check(solution.trap([3, 0, 3]),                              3, "TC09 - Symmetric valley")

// Multiple valleys
check(solution.trap([3, 0, 2, 0, 4]),                       7, "TC10 - Two valleys: water = 3+1+3")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next →](@next)
