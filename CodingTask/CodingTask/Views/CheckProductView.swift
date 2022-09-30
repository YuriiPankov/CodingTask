//
//  CheckProductView.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import SwiftUI

struct CheckProductView: View {
    var product: Product
    
    @ViewBuilder var viewToPresent: some View {
        if product.available {
            AvailableProductView(product: product)
        } else {
            NonavailableProductView(product: product)
        }
    }
    
    var body: some View {
        viewToPresent
    }
}

struct CheckProductView_Previews: PreviewProvider {
    static var previews: some View {
        CheckProductView(product: Product(name: "Yellow Triangle", type: "Triangle", id: 1, color: "Yellow", imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", colorCode: "FFECB3", available: true, releaseDate: 1460629605, description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", longDescription: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam", rating: 4.17, price: Price(value: 225.91, currency: "EUR")))
    }
}
