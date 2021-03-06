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

enum SaleIcons: String {
    case price = "dollarsign.square"
    case star = "star.fill"
}

enum ButtonsTypes {
    case fillLSize, borderedMSizeShort, borderedMSizeLong
}

enum ButtonsTitles: String {
    case menu = "Menu"
    case make = "Make gradient"
    case get = "Get uniq gradient"
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
        self.label.numberOfLines = 0
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

class SaleContainer {
    public var view = UIView()

    
    init(saleSizeText: LabelsText, starsCountText: LabelsText) {
        self.create(saleSizeText, starsCountText)
    }
    
    private func createIcon(type: SaleIcons, color: UIColor) -> UIImageView {
        let icon = UIImage(systemName: type.rawValue)
        let iconContainer = UIImageView()
        iconContainer.image = icon
        iconContainer.tintColor = color
        
        return iconContainer
    }
    
    private func create(_ saleSizeText: LabelsText, _ starsCountText: LabelsText) {
        // Fixed views
        let priceIcon = self.createIcon(type: .price, color: .green)
        let starIcon = self.createIcon(type: .star, color: .yellow)
        let saleLabel = CustomLabel(type: .sale, text: .sale).label
        let centerView = UIView()
        
        // Setted views
        let saleSizeLabel = CustomLabel(type: .nums, text: saleSizeText).label
        let starsCountLabel = CustomLabel(type: .nums, text: starsCountText).label
        
        let icons = [
            "price": priceIcon,
            "star": starIcon
        ]
        let labels = [
            "sale": saleLabel,
            "saleSize": saleSizeLabel,
            "starsCount": starsCountLabel
        ]
        self.compose(icons, labels, centerView)
    }
    
    private func compose(_ icons: [String:UIImageView], _ labels: [String:UILabel], _ centerView: UIView) {
        let view = self.view
        view.addSubview(icons["price"]!)
        view.addSubview(labels["sale"]!)
        view.addSubview(labels["saleSize"]!)
        view.addSubview(centerView)
        view.addSubview(icons["star"]!)
        view.addSubview(labels["starsCount"]!)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        icons["price"]!.translatesAutoresizingMaskIntoConstraints = false
        labels["sale"]!.translatesAutoresizingMaskIntoConstraints = false
        labels["saleSize"]!.translatesAutoresizingMaskIntoConstraints = false
        centerView.translatesAutoresizingMaskIntoConstraints = false
        icons["star"]!.translatesAutoresizingMaskIntoConstraints = false
        labels["starsCount"]!.translatesAutoresizingMaskIntoConstraints = false
        
        self.setIconSize(icon: icons["price"]!)
        self.setIconSize(icon: icons["star"]!)
        
        self.bindLeft(icons["price"]!, leftView: nil)
        self.bindBottom(icons["price"]!)
        
        self.bindLeft(labels["sale"]!, leftView: icons["price"]!)
        self.bindBottom(labels["sale"]!)
        
        self.bindLeft(labels["saleSize"]!, leftView: labels["sale"]!)
        self.bindBottom(labels["saleSize"]!)
        
        self.bindLeft(centerView, leftView: labels["saleSize"]!)
        self.bindBottom(centerView)
        
        centerView.topAnchor.constraint(equalTo: centerView.superview!.topAnchor).isActive = true
        self.bindLeft(icons["star"]!, leftView: centerView)
        self.bindBottom(icons["star"]!)
        
        self.bindLeft(labels["starsCount"]!, leftView: icons["star"]!)
        self.bindBottom(labels["starsCount"]!)
        labels["starsCount"]!.rightAnchor.constraint(equalTo: labels["starsCount"]!.superview!.rightAnchor).isActive = true
        
        let verticalLineView = self.createVerticalLine()
        centerView.addSubview(verticalLineView)
        setVerticalLineAnchors(verticalLineView)
    }
    
    private func bindLeft(_ view: UIView, leftView: UIView?) {
        if leftView != nil {
            view.leftAnchor.constraint(equalTo: leftView!.rightAnchor, constant: 5).isActive = true
        } else {
            view.leftAnchor.constraint(equalTo: view.superview!.leftAnchor).isActive = true
        }
    }
    
    private func bindBottom(_ view: UIView) {
        view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor).isActive = true
    }
    
    private func setIconSize(icon: UIImageView) {
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func createVerticalLine() -> UIView{
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        
        return lineView
    }
    
    private func setVerticalLineAnchors(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if view.superview != nil {
            view.widthAnchor.constraint(equalToConstant: 1).isActive = true
            view.heightAnchor.constraint(equalTo: view.superview!.heightAnchor, multiplier: 0.8).isActive = true
            view.centerXAnchor.constraint(equalTo: view.superview!.centerXAnchor, constant: 10).isActive = true
            self.bindBottom(view)
        } else { print("Warning! VerticalLineView needs superview!") }
    }
}

class CustomButton {
    public var button = UIButton()
    
    init(type: ButtonsTypes, title: ButtonsTitles) {
        
        self.create(type, title)
        self.setHeightAnchor(type)
    }
    
    private func create(_ type: ButtonsTypes, _ title: ButtonsTitles) {
        let button = self.button
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle(title.rawValue, for: .normal)
        
        switch type {
        case .fillLSize:
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
        default:
            button.backgroundColor = .none
            button.setTitleColor(.blue, for: .normal)
        }
    }
    
    private func setHeightAnchor(_ type: ButtonsTypes) {
        let button = self.button
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let height: CGFloat = type == .fillLSize ? 70 : 60
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

class CustomMap {
    public let map = MKMapView()
    
    init() {
        self.addSettings()
    }
    
    private func addSettings() {
        let map = self.map
        map.mapType = .standard
        map.isZoomEnabled = false
        map.isScrollEnabled = false
        map.layer.cornerRadius = 10
        map.layer.masksToBounds = true
        
        let location = CLLocation(latitude: 55.751244, longitude: 37.618423)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    public func setAnchors(topView: UIView) {
        let map = self.map
        if map.superview != nil {
            map.translatesAutoresizingMaskIntoConstraints = false
            map.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
            map.leftAnchor.constraint(equalTo: map.superview!.leftAnchor, constant: 30).isActive = true
            map.rightAnchor.constraint(equalTo: map.superview!.rightAnchor, constant: -30).isActive = true
            map.heightAnchor.constraint(equalTo: map.widthAnchor, multiplier: 0.625).isActive = true
        } else { print("Warning! Map needs superview!") }
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
    
    public func bindInformationButton(isShort: Bool, topView: UIView) {
        let view = self
        if isShort {
            if view.superview != nil {
                view.translatesAutoresizingMaskIntoConstraints = false
                view.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
                view.leftAnchor.constraint(equalTo: view.superview!.leftAnchor, constant: 45).isActive = true
                view.rightAnchor.constraint(equalTo: view.superview!.rightAnchor, constant: -45).isActive = true
            } else { print("Warning! Button needs superview!") }
        } else {
            self.bindInformation(topView: topView)
        }
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
    private let saleContainer = SaleContainer(saleSizeText: .numsSale, starsCountText: .numsStars).view
    
    // Labels
    private let titleLabel = CustomLabel(type: .title, text: .title).label
    private let subtitleLabel = CustomLabel(type: .subtitle, text: .subtitle).label
    private let pLabel = CustomLabel(type: .p, text: .p).label
    private let spanLabel = CustomLabel(type: .span, text: .span).label
    
    // Buttons
    private let menuButton = CustomButton(type: .borderedMSizeShort, title: .menu).button
    private let makeButton = CustomButton(type: .fillLSize, title: .make).button
    private let getButton = CustomButton(type: .borderedMSizeLong, title: .get).button
    
    // Map
    private let customMap = CustomMap()

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view!
        
        // Main container
        view.addSubview(mainContainer)
        mainContainer.bindMainContainer()
        mainContainer.isScrollEnabled = true
        
        // Image container
        imageContainer.image = image
        imageContainer.addSubview(imageSlider.view)
        imageSlider.setAnchors()
        view.addSubview(imageContainer)
        imageContainer.bindImageContainer()
        
        // Info container
        infoContainer.layer.cornerRadius = 10
        infoContainer.backgroundColor = .white
        view.addSubview(infoContainer)
        infoContainer.bindInfoContainer(topView: imageContainer)
        
        // Title and subtitle
        infoContainer.addSubview(titleLabel)
        titleLabel.bindInformation(topView: nil)
        infoContainer.addSubview(subtitleLabel)
        subtitleLabel.bindInformation(topView: titleLabel)
        
        // Sale container
        infoContainer.addSubview(saleContainer)
        saleContainer.translatesAutoresizingMaskIntoConstraints = false
        saleContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        saleContainer.bindInformation(topView: subtitleLabel)
        
        // P
        infoContainer.addSubview(pLabel)
        pLabel.bindInformation(topView: saleContainer)
        
        // Menu button
        infoContainer.addSubview(menuButton)
        menuButton.bindInformationButton(isShort: true, topView: pLabel)
        
        // Map
        let map = customMap.map
        infoContainer.addSubview(map)
        customMap.setAnchors(topView: menuButton)
        
        // Span label
        infoContainer.addSubview(spanLabel)
        spanLabel.bindInformation(topView: map)
        
        // Make button
        infoContainer.addSubview(makeButton)
        makeButton.bindInformationButton(isShort: false, topView: spanLabel)
        
        // Get button
        infoContainer.addSubview(getButton)
        getButton.bindInformationButton(isShort: false, topView: makeButton)
        
        //mainContainer.contentSize = view.frame.size
        mainContainer.contentSize = CGSize(width: view.frame.size.width, height: CGFloat(3000))
    }
}
