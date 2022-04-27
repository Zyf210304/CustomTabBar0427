//
//  ContentView.swift
//  CustomTabBar0427
//
//  Created by 张亚飞 on 2022/4/27.
//

import SwiftUI

struct ContentView: View {
    
    //Hiding native one
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab: Tab = .bookmark
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                Text("BookMark")
                    .applyBG()
                    .tag(Tab.bookmark)
                Text("Time")
                    .applyBG()
                    .tag(Tab.time)
                Text("Message")
                    .applyBG()
                    .tag(Tab.chat)
                Text("Camera")
                    .applyBG()
                    .tag(Tab.camera)
                Text("Setting")
                    .applyBG()
                    .tag(Tab.settings)
                
            }
            //自定义tabBar
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    
    func applyBG() -> some View {
        
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                
                Color("BG")
                    .ignoresSafeArea()
            }
            
    }
}
