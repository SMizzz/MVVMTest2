//
//  User.swift
//  MvvmTest2
//
//  Created by 신미지 on 2021/09/23.
//

import Foundation

struct Root: Codable {
  let loans: [Loans]
}

struct Loans: Codable {
  let id: Int
  let name: String
  let status: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case status
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    status = try values.decode(String.self, forKey: .status)
  }
}
