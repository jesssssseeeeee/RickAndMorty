import UIKit

final class CharacterCell: ReusableTableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.layer.cornerRadius = (imageView?.frame.height ?? 0) / 2
    }
    
    let statusView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        statusView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(statusView)
        NSLayoutConstraint.activate([
            statusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            statusView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                                
            statusView.topAnchor.constraint(equalTo: contentView.topAnchor),
            statusView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
