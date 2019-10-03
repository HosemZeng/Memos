//
//  UserData.swift
//  Memos
//
//  Created by hosem on 2019/10/2.
//  Copyright © 2019 Hosem. All rights reserved.
//

import Combine
import SwiftUI

final class MemoCopy: ObservableObject {
    @Published var id = Memo.default.id
    @Published var title = Memo.default.title
    @Published var text = Memo.default.text
    var isFavorite = Memo.default.isFavorite
    var imageName = Memo.default.imageName
}
