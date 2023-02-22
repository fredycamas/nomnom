//
//  ExpandFeature.swift
//  nomnom
//
//  Created by Life on 2/17/23.
//

import UIKit
struct Card {
    var name = "name here"
    var title = "title here"
    var descrip = "description goes in here"
}

class ExpandFeatureController: UIViewController {
    
    let card = Card()
    var quantity = 1
    var heart = "heart.fill"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setConstaints()
    }
    
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "person")
        return imageView
    }()
    
    private lazy var mealTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.text = card.title
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        for _ in 1...5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = .yellow
            stackView.addArrangedSubview(starImageView)
        }
        
        return stackView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "Description"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var mealDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = card.descrip
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Quantity "
        return label
    }()
    
    private lazy var quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.value = Double(quantity)
        stepper.addTarget(self, action: #selector(quantityStepperDidChange), for: .valueChanged)
        return stepper
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Price "
        return label
    }()
    
    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "$\(quantity + 1).00"
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func quantityStepperDidChange() {
        print("we are on quantity steeper did change")
    }
    
    @objc func addToCartButtonTapped(){
        print("we on add to card  tapped")
    }
    
    @objc func heartButtonTapped() {
        isHeartFilled.toggle()
    }
    
    private var isHeartFilled = false {
        didSet {
            let imageName = isHeartFilled ? "heart.fill" : "heart"
            heartButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }

}


extension  ExpandFeatureController{
    
    
    func setConstaints() {
        // Add the subviews to the scroll view
        scrollView.addSubview(mealImageView)
        scrollView.addSubview(mealTitleLabel)
        scrollView.addSubview(ratingStackView)
        scrollView.addSubview(heartButton)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(mealDescriptionLabel)
        scrollView.addSubview(quantityLabel)
        scrollView.addSubview(quantityStepper)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(priceValueLabel)
        scrollView.addSubview(addToCartButton)
        
        // Add the scroll view to the main view
        view.addSubview(scrollView)
        
        // Enable auto layout for all the views
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        mealDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityStepper.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up the constraints for the scroll view
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // Set up the constraints for the meal image view
        NSLayoutConstraint.activate([
            mealImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mealImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mealImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        // Set up the constraints for the meal title label
        NSLayoutConstraint.activate([
            mealTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            mealTitleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            mealTitleLabel.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 16),
        ])
        
        // Set up the constraints for the rating stack view
        NSLayoutConstraint.activate([
            ratingStackView.leadingAnchor.constraint(equalTo: mealTitleLabel.leadingAnchor),
            ratingStackView.topAnchor.constraint(equalTo: mealTitleLabel.bottomAnchor, constant: 8),
        ])
        // Set up the constraints for the rating stack view
        NSLayoutConstraint.activate([
            heartButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -8),
            heartButton.centerYAnchor.constraint(equalTo: ratingStackView.centerYAnchor),
        ])
        
        // Set up the constraints for the description label
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: mealTitleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 16),
        ])
        
        // Set up the constraints for the meal description label
        NSLayoutConstraint.activate([
            mealDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            mealDescriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            mealDescriptionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
        ])
        
        // Set up the constraints for the quantity label
        NSLayoutConstraint.activate([
            quantityLabel.leadingAnchor.constraint(equalTo: mealTitleLabel.leadingAnchor),
            quantityLabel.topAnchor.constraint(equalTo: mealDescriptionLabel.bottomAnchor, constant: 16),
            quantityLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
        ])
        
        // Set up the constraints for the quantity stepper
        NSLayoutConstraint.activate([
            quantityStepper.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 8),
            quantityStepper.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
        ])
        
        // Set up the constraints for the price label
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: quantityStepper.trailingAnchor, constant: 16),
            priceLabel.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
        ])
        
        // Set up the constraints for the price value label
        NSLayoutConstraint.activate([
            priceValueLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8), priceValueLabel.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
        ])
        
        
        
        NSLayoutConstraint.activate([
            addToCartButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            addToCartButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            addToCartButton.topAnchor.constraint(equalTo: priceValueLabel.bottomAnchor, constant: 16),
        ])
    }
}
