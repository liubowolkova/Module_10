//
//  Task1ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 18.04.2021.
//

import UIKit

struct Item {
    var name: String
    var description: String
    var image: UIImage
    var oldPrice: String
    var newPrice: String
    var percentageDifference: String
}

class Task1ViewController: UIViewController {
    // Data
    private var images = [UIImage(named: "Pic_1.png")]
    private lazy var oldPriceList = [""]
    private lazy var newPriceList = [""]
    private lazy var percentageDifference = [""]
    private lazy var itemsDescription = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        images = self.createImageStack(numberOfImages: 6)
        oldPriceList = self.createPriceList(numberOfItems: 6, range: 20000...60000)
        newPriceList = self.createPriceList(numberOfItems: 6, range: 1000...19990)
        percentageDifference = self.calcPercentageDiffForList(oldList: oldPriceList, newList: newPriceList)
        itemsDescription = self.createDescriptionsList(numberOfItems: 6)
        
        
        let items = self.createItemsList(description: itemsDescription, image: images as! [UIImage], oldPrice: oldPriceList, newPrice: newPriceList, percentageDifference: percentageDifference)
    }
    
    private func createImageStack(numberOfImages: Int) -> [UIImage]{
        var imageStack: [UIImage] = []
        for i in 0..<numberOfImages {
            imageStack.append(UIImage(named: "Pic_\(i+1).png")!)
        }
        
        return imageStack
    }
    
    // Supporting range 1000...99999
    private func generatePrice(range: ClosedRange<Int>) -> String {
        let price = Int.random(in: range)
        var priceString = String(price)
        
        // Convert "1000" to "1 000" or "10000" to "10 000"
        switch priceString.count {
        case 4:
            priceString.insert(" ", at: priceString.index(priceString.startIndex, offsetBy: 1))
        case 5:
            priceString.insert(" ", at: priceString.index(priceString.startIndex, offsetBy: 2))
        default: break
        }
        
        return priceString + " руб."
    }
    
    private func createPriceList(numberOfItems: Int, range: ClosedRange<Int>) -> [String] {
        var array: [String] = []
        for _ in 0..<numberOfItems {
            array.append(self.generatePrice(range: range))
        }
        
        return array
    }
    
    private func getPersentageDifference(oldPrice: String, newPrice: String) -> String {
        // Replace all non-numerical characters
        let oldP = oldPrice.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression, range: oldPrice.startIndex ..< oldPrice.endIndex)
        let newP = newPrice.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression, range: newPrice.startIndex ..< newPrice.endIndex)
        
        // (old price, new price)
        let price = (Float(oldP), Float(newP))
        let diffPercent = (price.0! - price.1!) / price.0! * 100
        
        return String(Int(diffPercent)) + "%"
    }
    
    private func calcPercentageDiffForList(oldList: [String], newList: [String]) -> [String] {
        var array: [String] = []
        for (i, e) in oldList.enumerated() {
            array.append(getPersentageDifference(oldPrice: e, newPrice: newList[i]))
        }
        
        return array
    }
    
    private func generateDescription() -> String {
        let first = ["The", "A", "New"]
        let second = ["picture", "image", "art"]
        let third = ["BOOM-BO", "ART-NOVO", "COLOR-ME"]
        
        let firstIndex = Int.random(in: 0...2)
        let secondIndex = Int.random(in: 0...2)
        let thirdIndex = Int.random(in: 0...2)
        
        let description = "\(first[firstIndex]) \(second[secondIndex]) \(third[thirdIndex]))"
        
        return description
    }
    
    private func createDescriptionsList(numberOfItems: Int) -> [String] {
        var array: [String] = []
        for _ in 0..<numberOfItems {
            array.append(self.generateDescription())
        }
        
        return array
    }
    
    private func createItemsList(description: [String], image: [UIImage], oldPrice: [String], newPrice: [String], percentageDifference: [String]) -> [Item] {
        var items: [Item] = []
        for (i, e) in description.enumerated() {
            let item = Item(name: "Item\(i)", description: e, image: image[i], oldPrice: oldPrice[i], newPrice: newPrice[i], percentageDifference: percentageDifference[i])
            items.append(item)
        }
        
        return items
    }
}
