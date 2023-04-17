//
//  Created by Sanish C.K.
//

import SwiftUI

struct BrandGridView: View {
  // MARK: - PROPERTY
  @ObservedObject private var viewModel = TouchDownViewModel()
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: {
      LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
          ForEach(viewModel.brands) { brand in
          BrandItemView(brand: brand)
        }
      }) //: GRID
      .frame(height: 200)
      .padding(15)
    })//: SCROLL
    .onAppear(perform: viewModel.fetchBrands)
  }
}

// MARK: - PREVIEW

struct BrandGridView_Previews: PreviewProvider {
  static var previews: some View {
    BrandGridView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
