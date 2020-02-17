//
//  LandmarkList.swift
//  TestSwiftUI2
//
//  Created by Apui on 2020/1/11.
//  Copyright © 2020 陈沛. All rights reserved.
//

//landmarkData, id: \.id 简化为 landmarkData

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}

/*
 NavigationLink(destination: LandmarkDetail()) {
         LandmarkRow(landMark: landmark)
     }
 }
 */
