//
//  ContentView.swift
//  IOSExam
//
//  Created by willaim santos on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    
    ///View Properties
    @StateObject private var vm = PhotoViewModel()
    
    @State private var query = ""
    @State var tabViewSelection = 1
    
    @State var offSet: CGFloat = 0
    
    @State var startOffiset: CGFloat = 0
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    TabView(selection: $tabViewSelection) {
                        ForEach(vm.loadPhotosData, id: \.self) { index in
                            CardView(fields: index)
                                .tag(index.id ?? 0)
                        }
                        .padding(.bottom, 40)
                    }
                    .frame(width: 350, height: 300)
                    .tabViewStyle(.page)
                    .tableStyle(.automatic)
                    .onChange(of: tabViewSelection) { oldValue, newValue in
                        print(oldValue, newValue)
                    }
                    ///Search Bar...
                    VStack {
                        HStack(spacing: 15) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 23, weight: .bold))
                                .foregroundStyle(.gray)
                            
                            TextField("Search", text: $query)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.primary.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding()
                        
                    }
                    .offset(y: offSet > 0 ?(offSet <= 90 ? -offSet : -90): 0)
                    
                    ///Divider Line...
                    HStack {
                        Text("User List")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Rectangle()
                            .fill()
                            .frame(height: 0.5)
                    }
                    .padding()
                    
                    List(vm.filterData, id: \.self) { index in
                        Text(index.name ?? "")
                            .font(.system(size: 15))
                            .tag(index.id)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, -5)
                    .listStyle(.insetGrouped)
                    .listItemTint(.accentColor)
                    .scrollIndicators(.hidden)
                    .searchable(text: $query)
                    .onChange(of: query) { (_, newQuery) in
                        vm.searchTextInFields(with: newQuery)
                    }
                    .onAppear {
                        vm.searchTextInFields()
                    }
                    .frame(height: 400)
                }
            }
        }
        
//        func getOffSet() -> CGSize {
//            
//            var size: CGSize = .zero
//            let screenWitdh = UIScreen.main.bounds.width / 2
//            size.width = offSet > 0 ? (offSet * 1.5 <= (screenWitdh)) : 0
//            size.height = offSet > 0 ? (-offSet) : 0
//            
//            return size
//        }
    }
}


#Preview {
    ContentView()
}
