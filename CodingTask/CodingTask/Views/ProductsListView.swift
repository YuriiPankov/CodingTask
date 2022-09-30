//
//  ProductsListView.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import SwiftUI

struct ProductsListView: View {
    let products: [Product] 
    let header: Header
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text(header.headerTitle)
                            .bold()
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack {
                        Text(header.headerDescription)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView {
                    ForEach(products) { product in
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            CheckProductView(product: product)
                        }
                    }
                    
                }
                
                HStack {
                    Text("© 2016 Check24")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
            }
        }
    }
}


struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(
            products: [
            Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: true, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 2.17, price: Price(value: 225.91, currency: "EUR")),
            Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: false, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 2.17, price: Price(value: 225.91, currency: "EUR"))
        ],
            header: Header(headerTitle: "Title", headerDescription: "description"))
    }
}
