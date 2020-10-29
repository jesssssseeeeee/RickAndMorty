import UIKit

final class ListView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    init(cellTypes: [ReusableTableViewCell.Type]) {
        super.init(frame: .zero)
        tableView.register(cellTypes)
        backgroundColor = .white
        addSubview(tableView)
    }

    override func layoutSubviews() {
        tableView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
