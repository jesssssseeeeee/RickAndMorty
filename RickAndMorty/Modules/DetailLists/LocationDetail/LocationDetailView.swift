import UIKit

final class LocationDetailView: UIView {
    var viewModel: Location? {
        didSet {
            guard let viewModel = viewModel else {
                return }
            nameLabel.text = viewModel.name
            typeLabel.text = viewModel.type
            dimensionLabel.text = viewModel.dimension
            createdLabel.text = viewModel.created
//            let dateString = viewModel.created
//            let date = Date(from: )
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM-dd-yyyy"
//            createdLabel.text = dateFormatter.string(from: viewModel.created)
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false /* надо изменять для constaints*/
        label.numberOfLines = 0
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let dimensionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let createdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(dimensionLabel)
        addSubview(createdLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            typeLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            typeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            dimensionLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 50),
            dimensionLabel
                .leadingAnchor
                .constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            dimensionLabel
                .trailingAnchor
                .constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            createdLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            createdLabel.topAnchor.constraint(equalTo: dimensionLabel.bottomAnchor, constant: 50),
            createdLabel
                .leadingAnchor
                .constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            createdLabel
                .trailingAnchor
                .constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
