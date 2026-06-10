//: [← Previous: 125. Valid Palindrome](@previous)
//:
//: # 167. Two Sum II - Input Array Is Sorted
//: [LeetCode](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
//:
//: Given a **1-indexed** array of integers `numbers` that is already sorted in **non-decreasing order**,
//: find two numbers such that they add up to a specific `target`.
//: Return the indices of the two numbers as `[index1, index2]` where `1 <= index1 < index2`.
//: Each input has **exactly one solution** and you may not use the same element twice.
//:
//: **Example 1:** Input: `numbers = [2,7,11,15], target = 9` → Output: `[1,2]`
//: **Example 2:** Input: `numbers = [2,3,4], target = 6` → Output: `[1,3]`
//: **Example 3:** Input: `numbers = [-1,0], target = -1` → Output: `[1,2]`

import Foundation

// MARK: - Solution

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        // Write your solution here
        var firstPointer = 0
        var lastPointer = numbers.count - 1
        
        while firstPointer < lastPointer {
            let currentSum = numbers[firstPointer] + numbers[lastPointer]
            if currentSum == target {
                return [firstPointer + 1, lastPointer + 1]
            } else if currentSum < target {
                firstPointer += 1
            } else {
                lastPointer -= 1
            }
        }
        return [-1, -1]
    }
}

// MARK: - Test Cases

let solution = Solution()

var passed = 0
var failed = [String]()

func check(_ result: [Int], _ expected: [Int], _ label: String) {
    if result == expected { passed += 1 }
    else { failed.append("\(label) (got \(result), expected \(expected))") }
}

check(solution.twoSum([2, 7, 11, 15], 9),          [1, 2], "TC01 - Basic example")
check(solution.twoSum([2, 3, 4], 6),                [1, 3], "TC02 - Answer at ends")
check(solution.twoSum([-1, 0], -1),                 [1, 2], "TC03 - Negative numbers")
check(solution.twoSum([1, 2], 3),                   [1, 2], "TC04 - Minimum two elements")
check(solution.twoSum([-3, -1, 0, 2, 5], 4),        [3, 5], "TC05 - Mixed negatives and positives")
check(solution.twoSum([1, 2, 3, 4, 5, 6], 11),      [5, 6], "TC06 - Last two elements")
check(solution.twoSum([1, 2, 3, 4, 5, 6], 3),       [1, 2], "TC07 - First two elements")
check(solution.twoSum([0, 0, 3, 4], 0),             [1, 2], "TC08 - Two zeros sum to zero")
check(solution.twoSum([-10, -5, -1, 0, 3, 8], -6),  [1, 3], "TC09 - Negative target")
check(solution.twoSum([1, 3, 5, 7, 9, 11, 13], 20), [6, 7], "TC10 - Larger sorted array")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next → 128. Longest Consecutive Sequence](@next)
