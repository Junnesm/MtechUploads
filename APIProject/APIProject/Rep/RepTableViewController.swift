//
//  RepTableViewController.swift
//  APIProject
//
//  Created by Junne Murdock on 12/14/22.
//

import UIKit
class RepTableViewController: UITableViewController{
  @IBOutlet weak var searchBar: UISearchBar!
  var items = [Rep]()
  var controller = RepController()
  func fetchMatchingItems() {
    self.items = []
    let searchTerm = searchBar.text ?? ""
    if !searchTerm.isEmpty {
      let query = [
        "zip": searchTerm,
        "output": "json"
      ]
      _ = Task {
        do {
          let items = try await controller.fetchRepInfo(zipCode: query)
          self.items = items
          self.tableView.reloadData()
        } catch {
          print(error)
        }
      }
    }
    self.tableView.reloadData()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
  }
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return items.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ReprCell", for: indexPath) as! RepCellTableViewCell
    let repCell = items[indexPath.row]
    cell.nameLabel.text = repCell.name
    cell.partyLabel.text = "\(repCell.party), \(repCell.state)"
    cell.linkLabel.text = "Link: \(repCell.link)"
    //get the cell
    //configure the cell
    //return the cell
    //cell.nameLabel
    return cell
  }
//  func configure(cell: RepCell, forItemAt indexPath: IndexPath) {
//
//    let item = items[indexPath.row]
//    cell.name = item.name
//    cell.state = item.state
//    cell.party = item.party
//  }
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    tableView.deselectRow(at: indexPath, animated: true)
//  }
}
extension RepTableViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    fetchMatchingItems()
    searchBar.resignFirstResponder()
  }
}











