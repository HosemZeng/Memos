/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import Foundation
import CoreLocation
import UIKit
import SwiftUI


let filePath : String = NSHomeDirectory() + "/Documents/data.plist" //存放用户数据的地址

var memoData = Memos()  //Memos类实例

func update(_ memoArray : [MemoStruct]){  //每次修改memo即更新一次
    let data : Data
    let encoder = PropertyListEncoder()
    let url = URL(fileURLWithPath: filePath)
    do {
        data = try encoder.encode(memoArray)
    } catch {
        fatalError("Error:\n\(error)")
    }
    do {
       try data.write(to: url)
    } catch {
        fatalError("Error:\n\(error)")
    }
    print(filePath)
}

final class Memos: ObservableObject {       //设置成ObservableObject使多个View可以监视该类实例和它被@Published标记的属性
    @Published var memos : [MemoStruct] = load()
    static var memosDefault : [MemoStruct] = loadResourse("MemoData.plist")
    
    static func  load() -> [MemoStruct] {
        let fileManager = FileManager.default
        let exist = fileManager.fileExists(atPath: filePath)
        if !exist{//判断文件是否存在，不存在即创建
            let data : Data
            guard let file = Bundle.main.url(forResource: "MemoData.plist", withExtension: nil)
            else {
                fatalError("Couldn't find MemoData.plist in main bundle.")
            }
            do {
                data = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load MemoData.plist from main bundle:\n\(error)")
            }
            let createSuccess = fileManager.createFile(atPath: filePath, contents:data, attributes:nil)
            print("文件创建结果: \(createSuccess)")
        }
        //文件存在，进行读取
        let data : Data
        let url = URL(fileURLWithPath: filePath)
        do {
            data = try Data(contentsOf: url)
        }catch {
            fatalError("Couldn't load MemoData.plist from (filePath):\n\(error)")
        }
        do {
            let decoder = PropertyListDecoder()
            return try decoder.decode([MemoStruct].self, from: data)
        } catch {
            fatalError("Error when decoding :\n\(error)")
    }
    }
    
    static func loadResourse<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
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
            let decoder = PropertyListDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
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
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
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

/*  不知为何失效，无法为返回的实例同添加新元素
var memoData : Memos {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: filePath) == false{
        let loadedMemo : [Memo] = load("MemoData.json")         //非常重要，帮助泛型函数类型推断
        update(loadedMemo)
        print(loadedMemo)
        return Memos()
    }
    else{
        return Memos()
    }
}  //Memos类实例
 */
