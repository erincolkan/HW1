//
//  AlgorithmManager.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import Foundation

extension String {
    //An extension to process a string value before checking whether it's a palindrome.
    //Just for fun and practice.
    func processed() -> String{
        return self.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: "!:?*.,;<> +-=%&()_^'")).reversed().reversed()
    }
}

class AlgoruthmManager: AlgorithmProtocol {
    
    // MARK: - Two Sum
    /*
     Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     You can return the answer in any order.
     
     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     Output: Because nums[0] + nums[1] == 9, we return [0, 1].
     */
    func twoSumTest() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print("result : \(result)")
    }
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //Maybe a complex search algorithm could be applied to improve algorithm complexity.
        //Since we're not dealing with huge arrays, performance doesn't matter that much.. Does it??
        
        //Basically check every item with every other item in the array to encounter a couple that adds up to our target.
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i]+nums[j] == target {
                    return [i,j]
                }
            }
        }
        
        //Return array [-1,-1] since two values cannot be found.
        return [-1,-1]
    }
    
    // MARK: - IsPalindrome
    /*
     Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     */
    func isPalindromTest() {
        let palindromeString = "no lemon, no melon"
        let nonPalindromeString = "Swift coding is quite fun, isn't it?"
        
        print("\(palindromeString) is palindrome?: \(isPalindrome(palindromeString))")
        print("\(nonPalindromeString) is palindrome?: \(isPalindrome(nonPalindromeString))")
    }
    
    func isPalindrome(_ s: String) -> Bool {
        //Please check String extension above to comprehend logic behind this.
        return s == s.processed()
    }
    
    // MARK: - Valid Anagram
    /*
     Given two strings s and t, return true if t is an anagram of s, and false otherwise.
     Input: s = "anagram", t = "nagaram"
     Output: true
     */
    func isAnagramTest() {
        let s = "anagram"
        let t = "nagaram"
        
        print("\(s) and \(t) are anagram?: \(isAnagram(s, t))")
    }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        //Convert each string to arrays and compare sorted versions to check if they actually contain the same characters.
        //I needed to sort string since == operator is sensitive to the order of the elements.
        return Array(s).sorted() == Array(t).sorted()
    }
    
    // MARK: - Contains Duplicate
    /*
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Input: nums = [1,2,3,1]
     Output: true
     Input: nums = [1,2,3,4]
     Output: false
     */
    func duplicateTest() {
        //Array with duplicate elements.
        let input1 = [4,5,6,8,2,3,2]
        
        //Array without duplicate elements
        let input2 = [1,8,4,3,5,6]
        
        print("\(input1) does contain duplicates?: \(containsDuplicate(input1))")
        print("\(input2) does contain duplicates?: \(containsDuplicate(input2))")
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        //Sort the array.
        let numsSorted = nums.sorted()
        
        for i in 0..<numsSorted.count {
            //Check if sorted array contains two same elements consequently.
            //Check value of i so that it doesn't throw index out of bounds exception.
            if i+1 < numsSorted.count && numsSorted[i] == numsSorted[i+1]{
                return true
            }
        }
        
        return false
    }
    
    // MARK: - Merge Sorted Array
    /*
    
     You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
     Merge nums1 and nums2 into a single array sorted in non-decreasing order.
     The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
     
     Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     Output: [1,2,2,3,5,6]
     Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
     */
    func mergeArraysTest() {
        var nums1 = [4,6,7,8,9,0,0,0]
        //I only wanted to dynamically retrieve length of nums1. It is inefficient, I know.
        let m = nums1.filter { $0 != 0 }.count
        
        let nums2 = [1,2,3]
        let n = nums2.count
        
        merge(&nums1, m, nums2, n)
        
        print("End result of merging: \(nums1)")
    }
    
    private func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        //I will go classical, since for now my Swift knowledge doesn't let me do something else.
        for i in 0..<n {
            nums1[nums1.count-n+i] = nums2[i]
        }
        
        //Sort the array to have desired output.
        nums1.sort()
    }
    
    // MARK: - Intersection of Two Arrays
    /*
     Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
     
     Input: nums1 = [1,2,2,1], nums2 = [2,2]
     Output: [2,2]
     */
    func arrayIntersectionTest() {
        let nums1 = [1,2,3,4,5,6,7,8,9]
        let nums2 = [0,-1,3,6,7,10]
        
        print("intersection of \(nums1) and \(nums2) is \(intersect(nums1, nums2))")
    }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        //Convert each params to Sets to make use of intersection method.
        //Since intersection returns a Set, convert it to an array to match the return type.
        return Array(Set(nums1).intersection(Set(nums2)))
    }
    
    // MARK: - Missing Number
    /*
     Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

     Input: nums = [3,0,1]
     Output: 2
     Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

     */
    func missingNumberTest() {
        //An array with elements [0,9], excluding number 4.
        let nums = [0,2,3,5,1,6,8,9,7]
        
        print("Missing number in \(nums) is : \(missingNumber(nums))")
    }
    
    private func missingNumber(_ nums: [Int]) -> Int {
        //Work on a sorted array since @param nums is not mutable.
        let numsSorted = nums.sorted()
        
        //Traverse array and find the element without a "successor"
        for i in 0..<numsSorted.count {
            if i+1 < numsSorted.count && numsSorted[i+1] != numsSorted[i] + 1  {
                return numsSorted[i]+1
            }
        }
        
        //Return -1 if such element is not found.
        return -1
    }
}
