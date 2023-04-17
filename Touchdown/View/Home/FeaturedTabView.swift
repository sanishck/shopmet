//
//  Created by Sanish C.K.
//

import SwiftUI

struct FeaturedTabView: View {
  // MARK: Properties
  @ObservedObject private var viewModel = TouchDownViewModel()
  
    var body: some View {
    TabView {
        ForEach(viewModel.players) { player in
        FeaturedItemView(player: player)
          .padding(.top, 10)
          .padding(.horizontal, 15)
      }
    } //: TAB
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    .onAppear(perform: viewModel.fetchPlayers)
  }
}

struct FeaturedTabView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTabView()
      .previewDevice("iPhone 12 Pro")
      .background(Color.gray)
  }
}
