//
//  NavStackInNavSplitView.swift
//  Navigation
//
//  Created by Eduard on 06.03.2023.
//

import SwiftUI

struct NavStackInNavSplitView: View {
    @State private var selection: Int?
    let columns: [GridItem] = [.init(.flexible()), .init(.flexible()), .init(.flexible()), .init(.flexible())]
    
    var body: some View {
        NavigationSplitView {
            List(1...20, id: \.self, selection: $selection) { index in
                Text("\(index)")
            }
        } detail: {
            NavigationStack{
                ZStack {
                    if let selection {
                        LazyVGrid(columns: columns, alignment: .center) { ForEach(1...(selection), id: \.self) { index in
                                    VStack {
                                        NavigationLink(value: index){
                                            VStack{
                                                Rectangle()
                                                    .fill(.green)
                                                Text("\(index)")
                                                    .font(.title)
                                            }
                                        }
                                    }.frame(width: 100, height: 100)
                        } }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background {
                                Color.yellow
                            }
                            .navigationTitle("\(selection)")
                    }
                }
                .navigationDestination(for: Int.self) { s  in
                    Text("\(s)")
                        .font(.system(size: 100))
                }
            }
        }
    }
}

struct NavStackInNavSplitView_Previews: PreviewProvider {
    static var previews: some View {
        NavStackInNavSplitView()
    }
}
