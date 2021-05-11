//
//  Task3_1ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 09.05.2021.
//

import UIKit
import MapKit

class ImageSlider {
    public var view = UIStackView()
    
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
            view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor, constant: -20).isActive = true
            view.widthAnchor.constraint(equalToConstant: 90).isActive = true
            view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        } else { print("Warning! ImageSlider needs superview!") }
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
    
    private func bindLeftRight(_ view: UIView) {
        view.rightAnchor.constraint(equalTo: view.superview!.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: view.superview!.leftAnchor).isActive = true
    }
    
    private func bindTop(_ view: UIView) {
        view.topAnchor.constraint(equalTo: view.superview!.topAnchor).isActive = true
    }
}

class Task3_1ViewController: UIViewController {
    private let mainContainer = UIScrollView()
    private let image = UIImage(named: "Pic_1.png")
    private let imageContainer = UIImageView()
    private let imageSlider = ImageSlider(count: 5)

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
        
        mainContainer.contentSize = view.frame.size
    }
}
