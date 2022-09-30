//
//  ProductDetailView.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import SwiftUI

struct ProductDetailView: View {
    private let defaultURL = AssetExtractor.createLocalUrl(forImageNamed: "DefaultImage")
    let product: Product
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.imageURL) ?? defaultURL!) {
                    Rectangle()
                    
                } image: { (img) -> Image in
                    Image(uiImage: img)
                        .resizable()
                }
                .scaledToFill()
                .frame(width: 60, height: 60)
                .padding(.leading)
                
                VStack {
                    HStack(alignment: .center) {
                        Text(product.name)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        
                    }
                    
                    HStack {
                        Text("Preis:")
                            .foregroundColor(.black)
                            .bold()
                        Text(product.price.value.description)
                            .foregroundColor(.black)
                        Text(product.price.currency)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        StarsView(rating: product.rating)
                            .frame(width: 10)
                        Spacer()
                        Text(Format.shortDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(product.releaseDate))))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            
            HStack {
                Text(product.description)
                    .foregroundColor(.gray)
                    .frame(height: 60)
                Spacer()
            }
            .padding()
            
            Button {
                // TODO: add action
            } label: {
                Text("Vormerken")
            }
            
            HStack {
                Text("Beschreibung")
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            .padding()
            
            ScrollView {
                HStack {
                    Text(product.longDescription)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
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

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: true, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 2.17, price: Price(value: 225.91, currency: "EUR")))
    }
}
