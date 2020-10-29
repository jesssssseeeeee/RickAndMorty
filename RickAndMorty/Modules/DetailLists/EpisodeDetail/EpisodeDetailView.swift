import UIKit

final class EpisodeDetailView: UIView {
    var viewModel: Episode? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            airDateLabel.text = viewModel.air_date
            episodeLabel.text = viewModel.episode
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(airDateLabel)
        addSubview(episodeLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            airDateLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            airDateLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            airDateLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            episodeLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            episodeLabel.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 50),
            episodeLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            episodeLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
