//
//  main.swift
//  SwiftDemo
//
//  Created by Adam Bennett on 3/20/20.
//  Copyright © 2020 Zipcode. All rights reserved.
//

import Foundation

print("Hello, World!")

func fibNumbs(nums counter:Int){
    var curr = 0
    var prev = curr
    for i in 0...counter{
        if(i != 0){
            print(curr)
            var temp = prev
            prev = curr
            curr += temp
        }else {
            print(curr)
            curr += 1
        }
    }
}

fibNumbs(nums: 10)