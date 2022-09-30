//
//  ContentView.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var productsInfo: ProductsInfo = ProductsInfo(header: Header(headerTitle: "", headerDescription: ""), products: [])
    
    @StateObject private var productsInfoFetcher: ProductsInfoViewModel = .init()
    
    var body: some View {
        TabView {
            ProductsListView(products: productsInfo.products, header: productsInfo.header)
                .tabItem {
                    Text("Alle")
                }
            
            ProductsListView(products: availableProducts, header: productsInfo.header)
                .tabItem {
                    Text("Verfügbar")
                }
            
            ProductsListView(products: favouriteProducts, header: productsInfo.header)
                .tabItem {
                    Text("Vorgemerkt")
                }
        }
        .onAppear {
            productsInfoFetcher.fetchData()
        }
        .onReceive(productsInfoFetcher.result) {
            productsInfo = $0
        }
    }
    
    class ProductsInfoViewModel: NetworkManager<ProductsInfo> {
        func fetchData() {
            guard let url = API.url else {
                error.send(.error(err: "Invalid URL"))
                return
            }
            call(URLRequest(url: url))
        }
    }
}

private extension ContentView {
    var availableProducts: [Product] {
        productsInfo.products.filter { product in
            product.available
        }
    }
    
    var favouriteProducts: [Product] {
        productsInfo.products.filter { product in
            UserDefaultsManager.shared.savedSymbols.contains(product.id)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(productsInfo: ProductsInfo(header: Header(headerTitle: "title", headerDescription: "description"), products: [
            Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: true, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 2.17, price: Price(value: 225.91, currency: "EUR")),
            Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: false, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 2.17, price: Price(value: 225.91, currency: "EUR"))
        ]))
    }
}
