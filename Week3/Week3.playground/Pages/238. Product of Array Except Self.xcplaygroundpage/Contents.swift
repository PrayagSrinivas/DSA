//: # 238. Product of Array Except Self
//: [LeetCode](https://leetcode.com/problems/product-of-array-except-self/)
//:
//: Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to
//: the product of all the elements of `nums` except `nums[i]`.
//: You must write an algorithm that runs in **O(n)** time and **without using the division operation**.
//:
//: **Example 1:** Input: `[1,2,3,4]` → Output: `[24,12,8,6]`
//: **Example 2:** Input: `[-1,1,0,-3,3]` → Output: `[0,0,9,0,0]`

import Foundation

// MARK: - Solution

class Solution {
    // Brute Force
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var result = Array(repeating: 1, count: nums.count)
//        
//        for i in 0..<nums.count {
//            for j in 0..<nums.count {
//                if i != j {
//                    result[i] *= nums[j]
//                }
//            }
//        }
//        return result
//    }
    
    // Optimal approach.
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixArray = Array(repeating: 1, count: nums.count)
        var suffixArray = Array(repeating: 1, count: nums.count)
        var result = [Int]()
        
        for i in 1..<nums.count {
            prefixArray[i] = prefixArray[i - 1] * nums[i - 1]
        }
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            suffixArray[i] = suffixArray[i + 1] * nums[i + 1]
        }
        
        for i in 0..<nums.count {
            result.append(prefixArray[i] * suffixArray[i])
        }
        
        return result
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

// LeetCode provided examples
check(solution.productExceptSelf([1, 2, 3, 4]),       [24, 12, 8, 6],  "TC01 - LeetCode Example 1")
check(solution.productExceptSelf([-1, 1, 0, -3, 3]),  [0, 0, 9, 0, 0], "TC02 - LeetCode Example 2 (contains zero)")

// Edge cases
check(solution.productExceptSelf([1, 1]),              [1, 1],          "TC03 - Two ones")
check(solution.productExceptSelf([2, 3]),              [3, 2],          "TC04 - Two elements")
check(solution.productExceptSelf([0, 0]),              [0, 0],          "TC05 - Two zeros")
check(solution.productExceptSelf([1, 0]),              [0, 1],          "TC06 - One zero, one non-zero")

// Negatives
check(solution.productExceptSelf([-1, -2, -3, -4]),   [-24, -12, -8, -6], "TC07 - All negatives")
check(solution.productExceptSelf([-1, 1]),             [1, -1],            "TC08 - One negative one positive")

// Multiple zeros
check(solution.productExceptSelf([0, 1, 2, 0]),       [0, 0, 0, 0],    "TC09 - Two zeros, all output zero")

// Larger input
check(solution.productExceptSelf([1, 2, 3, 4, 5]),    [120, 60, 40, 30, 24], "TC10 - Five elements")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next →](@next)
