//
//  Memo.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MemoStruct: Hashable,Codable,Identifiable {
    var id: Int
    var title: String
    var text: String
    var isFavorite: Bool
    var imageName: String
    static let `default` = Self(id:0, title:"无标题", text:"....", isFavorite: false, imageName:"one")
}


extension MemoStruct {
    var image: Image {
        ImageStore.shared.image(name:"one")
    }

}

extension Array {
func appendReturnLastElement(newElement: Element) -> Element {
    var result = self
    result.append(newElement)
    return result[result.count-1]
}
}
