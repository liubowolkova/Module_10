//
//  Task3_1ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 09.05.2021.
//

import UIKit
import MapKit

enum LabelsTypes {
    case title, subtitle, p, span, sale, nums
}

enum LabelsText: String {
    case title = "Fantastic Gradient"
    case subtitle = "Some images"
    case p = "What do you need for making interesting gradient? All you need is Figma and Imagination!"
    case span = "Creating gradient is free. You can pay 1$ if you really want waste some money"
    case sale = "Sale"
    case numsSale = "20%"
    case numsStars = "5.0"
}

class ImageSlider {
    public lazy var view = UIStackView()
    
    init(count: UInt) {
        let slides = self.create(count)
        self.view = self.add(slides)
    }
    
    private func create(_ count: UInt) -> [UIView] {
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
    
    private func add(_ slides: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: slides)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }
    
    public func setAnchors() {
        let view = self.view
        if view.superview != nil {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.centerXAnchor.constraint(equalTo: view.superview!.centerXAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor, constant: -25).isActive = true
            view.widthAnchor.constraint(equalToConstant: 90).isActive = true
            view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        } else { print("Warning! ImageSlider needs superview!") }
    }
}

class CustomLabel {
    public lazy var label = UILabel()
    
    init(type: LabelsTypes, text: LabelsText) {
        self.create(type, text)
    }
    
    private func create(_ type: LabelsTypes, _ text: LabelsText) {
        self.label.text = text.rawValue
        var fontName: String
        var fontSize: CGFloat
        var color: UIColor
        var aligment: NSTextAlignment
        
        switch type {
        case .title:
            fontName = "Thonburi-Bold"
            fontSize = 26
            color = .black
            aligment = .center
        case .subtitle:
            fontName = "HelveticaNeue"
            fontSize = 20
            color = .gray
            aligment = .center
        case .p:
            fontName = "HelveticaNeue"
            fontSize = 18
            color = .black
            aligment = .left
        case .span:
            fontName = "HelveticaNeue"
            fontSize = 16
            color = .lightGray
            aligment = .center
        case .sale:
            fontName = "HelveticaNeue"
            fontSize = 19
            color = .black
            aligment = .left
        case .nums:
            fontName = "Thonburi-Bold"
            fontSize = 22
            color = .black
            aligment = .left
        }
        
        self.label.font = UIFont(name: fontName, size: fontSize)
        self.label.textColor = color
        self.label.textAlignment = aligment
    }
}

extension UIView {
    public func bindMainContainer() {
        let view = self
        if view.superview != nil {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: view.superview!.topAnchor).isActive = true
            self.bindLeftRight(view)
            view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor).isActive = true
        } else { print("Warning! MainContainer needs superview!") }
    }
    
    public func bindImageContainer() {
        let view = self
        if view.superview != nil {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.bindTop(view)
            self.bindLeftRight(view)
            view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66).isActive = true
        } else { print("Warning! ImageContainer needs superview!") }
    }
    
    public func bindInfoContainer(topView: UIView) {
        let view = self
        if view.superview != nil {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
            self.bindLeftRight(view)
            self.bindBottom(view)
        } else { print("Warning! InfoContainer needs superview!") }
    }
    
    public func bindInformation(topView: UIView?) {
        let view = self
        if view.superview != nil {
            view.translatesAutoresizingMaskIntoConstraints = false
            if topView != nil {
                view.topAnchor.constraint(equalTo: topView!.bottomAnchor, constant: 20).isActive = true
            } else {
                view.topAnchor.constraint(equalTo: view.superview!.topAnchor, constant: 20).isActive = true
            }
            view.leftAnchor.constraint(equalTo: view.superview!.leftAnchor, constant: 30).isActive = true
            view.rightAnchor.constraint(equalTo: view.superview!.rightAnchor, constant: -30).isActive = true
            
        } else { print("Warning! Content needs superview!") }
    }
    
    private func bindLeftRight(_ view: UIView) {
        view.rightAnchor.constraint(equalTo: view.superview!.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: view.superview!.leftAnchor).isActive = true
    }
    
    private func bindTop(_ view: UIView) {
        view.topAnchor.constraint(equalTo: view.superview!.topAnchor).isActive = true
    }
    
    private func bindBottom(_ view: UIView) {
        view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor).isActive = true
    }
}

class Task3_1ViewController: UIViewController {
    // Containers
    private let mainContainer = UIScrollView()
    private let image = UIImage(named: "Pic_1.png")
    private let imageContainer = UIImageView()
    private let imageSlider = ImageSlider(count: 5)
    private let infoContainer = UIView()
    
    // Labels
    private let titleLabel = CustomLabel(type: .title, text: .title).label
    private let subtitleLabel = CustomLabel(type: .subtitle, text: .subtitle).label
    private let pLabel = CustomLabel(type: .p, text: .p).label
    private let spanLabel = CustomLabel(type: .span, text: .span).label
    private let sale = CustomLabel(type: .sale, text: .sale).label
    private let numSale = CustomLabel(type: .nums, text: .numsSale).label
    private let numStars = CustomLabel(type: .nums, text: .numsStars).label

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view!
        
        view.addSubview(mainContainer)
        mainContainer.bindMainContainer()
        
        imageContainer.image = image
        imageContainer.addSubview(imageSlider.view)
        imageSlider.setAnchors()
        view.addSubview(imageContainer)
        imageContainer.bindImageContainer()
        
        infoContainer.layer.cornerRadius = 10
        infoContainer.backgroundColor = .white
        view.addSubview(infoContainer)
        infoContainer.bindInfoContainer(topView: imageContainer)
        
        infoContainer.addSubview(titleLabel)
        titleLabel.bindInformation(topView: nil)
        infoContainer.addSubview(subtitleLabel)
        subtitleLabel.bindInformation(topView: titleLabel)
        
        
        mainContainer.contentSize = view.frame.size
    }
}
