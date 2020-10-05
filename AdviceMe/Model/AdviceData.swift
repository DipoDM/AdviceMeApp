//
//  AdviceData.swift
//  AdviceMe
//
//  Created by ODM on 7/19/20.
//  Copyright © 2020 ODM. All rights reserved.
//

import Foundation

struct AdviceResult : Decodable{
    let slip : Feedback
}

struct Feedback : Decodable {
    let id : Int
    let advice : String
}
