import UIKit

final class CharacterDetailView: UIView {
    var viewModel: Character? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            statusLabel.text = viewModel.status
            speciesLabel.text = viewModel.species
            genderLabel.text = viewModel.gender
            characterIcon.kf.setImage(with: URL(string: "https://rickandmortyapi.com/api/character/avatar/\(viewModel.id).jpeg"))
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let characterIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = .red
        return icon
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(speciesLabel)
        addSubview(genderLabel)
        addSubview(characterIcon)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            statusLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            speciesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            speciesLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            speciesLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            genderLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            genderLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            characterIcon.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            characterIcon.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 100),
            characterIcon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            characterIcon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

