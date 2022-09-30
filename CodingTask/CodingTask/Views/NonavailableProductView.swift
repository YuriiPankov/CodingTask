//
//  NonavailableProductView.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import SwiftUI

struct NonavailableProductView: View {
    private let defaultURL = AssetExtractor.createLocalUrl(forImageNamed: "DefaultImage")
    
    var product: Product
    
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .center) {
                    Text(product.name)
                        .foregroundColor(.black)
                        .bold()
                    
                    Spacer()
                    
                    Text(Format.shortDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(product.releaseDate))))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text(product.description)
                        .foregroundColor(.gray)
                        .frame(height: 60)
                    Spacer()
                }
                
                
                HStack {
                    Text("Preis:")
                        .bold()
                    Text(product.price.value.description)
                        .foregroundColor(.black)
                    Text(product.price.currency)
                        .foregroundColor(.black)
                    Spacer()
                    StarsView(rating: product.rating)
                        .frame(width: 10)
                    Spacer()
                    
                }
            }
            .padding()
            
            AsyncImage(url: URL(string: product.imageURL) ?? defaultURL!) {
                Rectangle()
                
            } image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
            }
            .scaledToFill()
            .frame(width: 60, height: 60)
            .padding(.trailing)
        }
        .background(Rectangle().stroke(Color.gray))
        .padding()
    }
}

struct NonavailableProductView_Previews: PreviewProvider {
    static var previews: some View {
        NonavailableProductView(product: Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: false, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 4.17, price: Price(value: 225.91, currency: "EUR")))
    }
}
