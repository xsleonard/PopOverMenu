//
//  PopOverViewController
//

import Foundation
import UIKit

open class PopOverViewController: UITableViewController, UIAdaptivePresentationControllerDelegate {
    
    var titles: [String] = []
    @objc open var completionHandler: ((_ selectRow: Int) -> Void)?
    var selectRow:Int?
    var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 15)
    var detailLabelFont: UIFont = UIFont.systemFont(ofSize: 10)
    var cellHeight: CGFloat = 45

    var storedSeparatorStyle: UITableViewCell.SeparatorStyle = UITableViewCell.SeparatorStyle.none
    var storedShowsVerticalScrollIndicator = false

    internal let cellIdentifier = "cell"

    override open func viewDidLoad() {
        super.viewDidLoad()

        self.modalPresentationStyle = UIModalPresentationStyle.popover
        self.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        // arrow color
        self.popoverPresentationController?.backgroundColor = UIColor.white

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = cellHeight
        tableView.tableFooterView = UIView()
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = storedShowsVerticalScrollIndicator
        tableView.separatorStyle = storedSeparatorStyle
        tableView.accessibilityIdentifier = "PopOverMenuTableView"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        if (selectRow != nil) {
            let selectIndexPath:IndexPath = IndexPath(row: selectRow!, section: 0)
            tableView.scrollToRow(at: selectIndexPath, at: .middle, animated: true)
        }
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc open func set(titles: [String]) {
        self.titles = titles
    }
    
    @objc open func set(cellHeight: CGFloat) {
        self.cellHeight = cellHeight
    }
    
    @objc open func set(selectRow: Int) {
        self.selectRow = selectRow
    }
    
    @objc open func set(separatorStyle: UITableViewCell.SeparatorStyle) {
        self.storedSeparatorStyle = separatorStyle
    }
    
    @objc open func set(titleLabelFont: UIFont) {
        self.titleLabelFont = titleLabelFont
    }
    
    @objc open func set(detailLabelFont: UIFont) {
        self.detailLabelFont = detailLabelFont
    }
    
    @objc open func set(showsVerticalScrollIndicator: Bool) {
        self.storedShowsVerticalScrollIndicator = showsVerticalScrollIndicator
    }
    
    internal func getMenuHeight(view: UIView, titles: [String]) -> CGFloat {
        let menuRowsLength = CGFloat((titles.count) * 43)
        let viewHeight = view.frame.size.height
        let menumaxHeight = viewHeight - 70
        let menuHeight = menuRowsLength > menumaxHeight ? menumaxHeight : menuRowsLength

        return menuHeight
    }
}
