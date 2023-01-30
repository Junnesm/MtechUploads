//
//  StoreItemTableViewDiffableDataSource.swift
//  iTunesSearch
//
//  Created by Junne Murdock on 1/29/23.
//

import UIKit

class StoreItemTableViewDiffableDataSource: UITableViewDiffableDataSource<String, StoreItem>  {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }

}
