//
//  Data2Struct.swift
//  WatchOSOnly-RESTAPI WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/18/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import Foundation

//struct Wrapper {
//    let toDoItems: [UserResponseModel]
//}

struct UserResponseModel: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
