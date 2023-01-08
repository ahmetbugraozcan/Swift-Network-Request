//
//  TodoModel.swift
//  NetworkRequestExample
//
//  Created by Ahmet Buğra Özcan on 7.01.2023.
//

import Foundation


struct TodoModel: Codable{
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
    
}
