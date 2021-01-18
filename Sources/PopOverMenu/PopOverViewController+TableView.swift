//
//  PopOverViewController
//

import Foundation
import UIKit

extension PopOverViewController {
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = titles[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = title
        cell.textLabel?.font = titleLabelFont
        cell.textLabel?.sizeToFit()

        if (selectRow == nil) {
            cell.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            cell.accessoryType = selectRow == indexPath.row ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        }

        // Erase the last separator
        if titles.count == indexPath.row + 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        }

        return cell
    }
    
    override open func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.dismiss(animated: true, completion: {
            if let handler = self.completionHandler {
                let selectRow = indexPath.row
                handler(selectRow)
            }
        })
    }
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
