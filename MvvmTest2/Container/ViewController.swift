//
//  ViewController.swift
//  MvvmTest2
//
//  Created by 신미지 on 2021/09/23.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var roots = [Loans]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func getData() {
    NetworkManager.getData { (Root) in
      self.roots = Root.loans
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      
    }
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return roots.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = roots[indexPath.row].name
    return cell
  }
}
