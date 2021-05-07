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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Container for image and slider
        let mainImageContainer = createImageContainer(image: mainImage!, width: frameSize.width, height: frameSize.width * 2 / 3)
        
        // Image slider
        let imageSlider = createImageSlider(count: 5)
        let sliderStack = createSliderStackWithinView(subviews: imageSlider, superView: mainImageContainer)
        
        // Main information container
        let infoContainer = createInfoContainer()
        infoContainer.translatesAutoresizingMaskIntoConstraints = false
        infoContainer.widthAnchor.constraint(equalToConstant: frameSize.width).isActive = true
        
        
        let title = createLabel(name: "Fantastic gradient", type: .title)
        let subtitile = createLabel(name: "Some pictures", type: .subtitle)
        
        infoContainer.addArrangedSubview(title)
        infoContainer.addArrangedSubview(subtitile)
        
        scrollView.addSubview(mainImageContainer)
        scrollView.addSubview(infoContainer)
        scrollView.contentSize = CGSize(width: frameSize.width, height: frameSize.width)
    }
    
    private func createImageContainer(image: UIImage, width: CGFloat, height: CGFloat) -> UIImageView {
        let container = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        container.image = image
        
        return container
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
    
    private func createSliderStackWithinView(subviews: [UIView], superView: UIView) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        superView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 90).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        return stack
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
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .fill:
            button.backgroundColor = .blue
            button.tintColor = .white
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        case .bordered where size == .m:
            button.backgroundColor = .none
            button.tintColor = .blue
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        default:
            button.backgroundColor = .blue
            button.tintColor = .white
            button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        
        return button
    }
}
