/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import Foundation
import CoreLocation
import UIKit
import SwiftUI

var MemoData: [Memo] = load("MemoData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


/*func update(_ memoArray : [Memo]) {
    do {
        let fileURL = try FileManager.default
            .url(for: .Memos.Resources , in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("MemoData.json")

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try encoder.encode(memoArray)
        try data.write(to: fileURL)
        
    } catch {
        print(error)
    }
}*/

func update(_ memoArray : [Memo]){
    let filePath : String = NSHomeDirectory() + "/Documents/data.plist"
    NSArray(array: memoArray).write(toFile: filePath, atomically: true )
    print(filePath)
}


final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(verbatim: name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).png from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}

