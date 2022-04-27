//
//  CustomTabBar.swift
//  CustomTabBar0427
//
//  Created by 张亚飞 on 2022/4/27.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    @State var yOffset: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            
            let width = proxy.size.width
            
            HStack {
                ForEach(Tab.allCases, id:\.rawValue) { tab in
                    
                    Button {
                        
                        withAnimation(.easeInOut(duration: 0.2)) {
                            
                            currentTab = tab
                            yOffset = -60
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.05)) {
                            yOffset = 0
                        }
                    } label: {
                        
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth:.infinity)
                            .foregroundColor(currentTab == tab ? .purple : .gray)
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }
                }
            }
            .background(alignment: .leading, content: {
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 25, height: 25)
                    .offset(x: 10, y: yOffset)
                    .offset(x: indicatorOffset(width: width))
            })
        }
        .frame(height: 30)
        .padding(.bottom, 10)
        .padding([.horizontal, .top])
    }
    
    func indicatorOffset(width: CGFloat) -> CGFloat {
        
        let index = CGFloat(getIndex())
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
    }
    
    
    func getIndex() -> Int {
        
        switch currentTab {
        case .bookmark:
            return 0
        case .time:
            return 1
        case .camera:
            return 2
        case .chat:
            return 3
        case .settings:
            return 4
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
