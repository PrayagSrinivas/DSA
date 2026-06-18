//: [← Previous: 238. Product of Array Except Self](@previous)
//:
//: # 53. Maximum Subarray
//: [LeetCode](https://leetcode.com/problems/maximum-subarray/)
//:
//: Given an integer array `nums`, find the subarray with the largest sum, and return its sum.
//:
//: **Example 1:**
//: - Input: `nums = [-2,1,-3,4,-1,2,1,-5,4]`
//: - Output: `6`
//: - Explanation: The subarray `[4,-1,2,1]` has the largest sum `6`.
//:
//: **Example 2:**
//: - Input: `nums = [1]`
//: - Output: `1`
//: - Explanation: The subarray `[1]` has the largest sum `1`.
//:
//: **Example 3:**
//: - Input: `nums = [5,4,-1,7,8]`
//: - Output: `23`
//: - Explanation: The subarray `[5,4,-1,7,8]` has the largest sum `23`.
//:
//: **Constraints:**
//: - `1 <= nums.length <= 10^5`
//: - `-10^4 <= nums[i] <= 10^4`
//:
//: **Follow-up:** If you have figured out the O(n) solution, try coding another solution using the **divide and conquer** approach, which is more subtle.

import Foundation

// MARK: - Solution

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard let first = nums.first else { return 0 }
        var maxSum = first
        var currSum = 0
        
        for item in nums {
            currSum += item
            maxSum = max(currSum, maxSum)
            
            if currSum < 0 {
                currSum = 0
            }
        }
        
        return maxSum
    }
}

// MARK: - Test Cases

let solution = Solution()

var passed = 0
var failed = [String]()

func check(_ result: Int, _ expected: Int, _ label: String) {
    if result == expected {
        passed += 1
    } else {
        failed.append(label)
    }
}

// LeetCode Example 1
check(solution.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]), 6, "TC01 - Example 1")

// LeetCode Example 2
check(solution.maxSubArray([1]), 1, "TC02 - Example 2: Single element")

// LeetCode Example 3
check(solution.maxSubArray([5, 4, -1, 7, 8]), 23, "TC03 - Example 3: All positive except one")

// Single negative element
check(solution.maxSubArray([-1]), -1, "TC04 - Single negative element")

// All negative numbers
check(solution.maxSubArray([-2, -1]), -1, "TC05 - All negative numbers")

// All positive numbers
check(solution.maxSubArray([1, 2, 3, 4, 5]), 15, "TC06 - All positive numbers")

// Alternating positive and negative
check(solution.maxSubArray([1, -2, 3, -4, 5]), 5, "TC07 - Alternating values")

// Large array with mix
check(solution.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4, 10, -1, 2]), 15, "TC08 - Larger array")

// Subarray in the middle
check(solution.maxSubArray([-5, -2, 3, 4, -1, -8]), 6, "TC09 - Subarray in middle")

// Entire array is the answer
check(solution.maxSubArray([1, 2, -1, 3, 4]), 9, "TC10 - Entire array is max")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next →](@next)

