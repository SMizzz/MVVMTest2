//
//  NetworkManager.swift
//  MvvmTest2
//
//  Created by 신미지 on 2021/09/23.
//

import Moya

class NetworkManager {
  static let provider = MoyaProvider<UserAPI>()
  static func getData(
    completion: @escaping(Root) -> ()
  ) {
    provider.request(.getData) { (result) in
      switch result {
      case .success(let res):
        do {
          let userData = try JSONDecoder().decode(Root.self, from: res.data)
          completion(userData)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}
