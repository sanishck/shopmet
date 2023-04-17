//
//  Created by Sanish C.K.
//

import SwiftUI

struct CategoryGridView: View {
  // MARK: - PROPERTY
    @ObservedObject private var viewModel = TouchDownViewModel()
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: {
      LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
        Section(
          header: SectionView(rotateClockwise: false),
          footer: SectionView(rotateClockwise: true)
        ) {
            ForEach(viewModel.categories) { category in
            CategoryItemView(category: category)
          }
        }
      }) //: GRID
      .frame(height: 140)
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
    })//: SCROLL
    .onAppear(perform: viewModel.fetchCategories)
  }
}

// MARK: - PREVIEW

struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
