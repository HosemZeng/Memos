//
//  Memo.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Memo: Hashable,Codable,Identifiable {
    var id: Int
    var title: String
    var text: String
    var isFavorite: Bool
    var imageName: String
    static let `default` = Self(id:0, title:"无标题", text:"....", isFavorite: false, imageName:"one")
}

extension Memo {
    var image: Image {
        ImageStore.shared.image(name:"one")
    }
}
