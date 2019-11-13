//
//  ApiRoutesTVC.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import UIKit

class ApiRoutesTVC: UITableViewController {
  
  enum Routes: String, CaseIterable {
    case listMonmonds, viewMonmond, insertMonmond, updateMonmond, deleteMonmond, transactionMonmond, uploadMonmond
  }
  
  var didSelectRowAt: ((Routes) -> ())?
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = String(describing: Self.self)
    view.backgroundColor = .white
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Routes.allCases.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = Routes.allCases[indexPath.row].rawValue
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    didSelectRowAt?(Routes.allCases[indexPath.row])
  }
  
}
