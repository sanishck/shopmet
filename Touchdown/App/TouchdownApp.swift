//
//  Created by Sanish C.K.
//

import SwiftUI
import Firebase

@main
struct TouchdownApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
