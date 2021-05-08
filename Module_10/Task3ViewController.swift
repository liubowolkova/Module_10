//
//  Task3ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 02.05.2021.
//

import UIKit

enum LabelTypes {
    case title, subtitle, p, span, nums
}

enum ButtonTypes {
    case fill, bordered
}

enum ButtonSize {
    case m, l
}

class Task3ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    private lazy var mainImage = UIImage(named: "Pic_1.png")
    private lazy var frameSize = view.frame.size
    
    //Basic containers
    private lazy var mainImageContainer = createImageContainer(image: mainImage!)
    private lazy var infoContainer = createInfoContainer()
    
    private lazy var imageSlider = createImageSlider(count: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sliderStack = createSliderStack(views: imageSlider)
        mainImageContainer.addSubview(sliderStack)
        setSliderStackAnchors(stack: sliderStack, superView: mainImageContainer)
        scrollView.addSubview(mainImageContainer)
        setImageContainerAnchors(container: mainImageContainer, superView: scrollView)
        
        let title = createLabel(name: "Fantastic gradient", type: .title)
        let subtitle = createLabel(name: "Some images", type: .subtitle)
        infoContainer.addArrangedSubview(title)
        infoContainer.addArrangedSubview(subtitle)
        scrollView.addSubview(infoContainer)
        setInfoContainerAnchors(container: infoContainer, superView: scrollView, topView: mainImageContainer)
        
        scrollView.contentSize = CGSize(width: frameSize.width, height: frameSize.height)
    }
    
    private func createImageContainer(image: UIImage) -> UIImageView {
        let container = UIImageView()
        container.image = image
        
        return container
    }
    
    private func setImageContainerAnchors(container: UIImageView, superView: UIView) {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: frameSize.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: frameSize.width / 3 * 2).isActive = true
    }
    
    private func createImageSlider(count: UInt) -> [UIView] {
        var sliders: [UIView] = []
        
        for i in 0..<count {
            let circleView = UIView()
            circleView.layer.cornerRadius = 5
            if i == 0 {
                circleView.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
            } else {
                circleView.layer.borderWidth = 1
                circleView.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
                circleView.layer.backgroundColor = .none
            }
            sliders.append(circleView)
        }
        
        return sliders
    }
    
    private func createSliderStack(views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }
    
    private func setSliderStackAnchors(stack: UIStackView, superView: UIView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 90).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
        
    private func createInfoContainer() -> UIStackView {
        let infoView = UIStackView()
        infoView.axis = .vertical
        infoView.alignment = .center
        infoView.distribution = .fillProportionally
        infoView.spacing = 20
        
        infoView.backgroundColor = .red
        
        return infoView
    }
    
    private func setInfoContainerAnchors(container: UIStackView, superView: UIView, topView: UIView) {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: frameSize.width).isActive = true
    }
    
    private func createLabel(name: String, type: LabelTypes) -> UILabel {
        let label = UILabel()
        label.text = name
        var fontName: String
        var fontSize: CGFloat
        var color: UIColor
        
        switch type {
        case .title:
            fontName = "Thonburi-Bold"
            fontSize = 26
            color = .black
        case .subtitle:
            fontName = "HelveticaNeue"
            fontSize = 20
            color = .gray
        case .p:
            fontName = "HelveticaNeue"
            fontSize = 18
            color = .black
        case .span:
            fontName = "HelveticaNeue"
            fontSize = 16
            color = .lightGray
        case .nums:
            fontName = "Thonburi-Bold"
            fontSize = 22
            color = .black
        }
        
        label.font = UIFont(name: fontName, size: fontSize)
        label.tintColor = color
        
        return label
    }
    
    private func createIcon(name: String, color: UIColor) -> UIImageView{
        let icon = UIImage(systemName: name)
        let iconContainer = UIImageView()
        iconContainer.image = icon
        iconContainer.tintColor = color
        
        return iconContainer
    }
    
    private func createButton(name: String, type: ButtonTypes, size: ButtonSize) -> UIButton {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        // button.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .fill:
            button.backgroundColor = .blue
            button.tintColor = .white
            //button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        case .bordered where size == .m:
            button.backgroundColor = .none
            button.tintColor = .blue
            //button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        default:
            button.backgroundColor = .blue
            button.tintColor = .white
            //button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        
        return button
    }
}
