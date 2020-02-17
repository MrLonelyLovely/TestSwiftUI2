//
//  UserData.swift
//  TestSwiftUI2
//
//  Created by Apui on 2020/1/12.
//  Copyright © 2020 陈沛. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
