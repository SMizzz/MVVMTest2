//
//  Parser.swift
//  MvvmTest2
//
//  Created by 신미지 on 2021/09/23.
//

import Moya

enum UserAPI {
  case getData
}

extension UserAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "https://api.kivaws.org/v1/loans/newest.json") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .getData:
      return ""
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getData:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .getData:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .getData:
      return ["Content-Type": "application/json"]
    }
  }
  
  
}
