//
//  Created by Sanish C.K. on 17/04/2023.
//

import SwiftUI
import FirebaseFirestore

class TouchDownViewModel: ObservableObject {
    // MARK: Reference to our Model
    @Published var brands = [Brand]()
    @Published var players = [Player]()
    @Published var categories = [Category]()
    
    private var databaseReference = Firestore.firestore()
    // Read data from firebase
    
    func fetchBrands() {
        databaseReference.collection("brand").getDocuments { q, e in
            guard let documents = q?.documents else { return }
            self.brands = documents.compactMap { queryDocumentSnapshot in
                return Brand(id: queryDocumentSnapshot.data()["id"] as! String, image: queryDocumentSnapshot.data()["image"] as! String);
            }
        }
    }
    
    func fetchPlayers() {
        databaseReference.collection("player").getDocuments { q, e in
            guard let documents = q?.documents else { return }
            self.players = documents.compactMap { queryDocumentSnapshot in
                return Player(id: queryDocumentSnapshot.data()["id"] as! String, image: queryDocumentSnapshot.data()["image"] as! String);
            }
        }
    }
    
    func fetchCategories() {
        databaseReference.collection("category").getDocuments { q, e in
            guard let documents = q?.documents else { return }
            self.categories = documents.compactMap { queryDocumentSnapshot in
                return Category(id: queryDocumentSnapshot.data()["id"] as! Int, name: queryDocumentSnapshot.data()["name"] as! String, image: queryDocumentSnapshot.data()["image"] as! String);
            }
        }
    }
    
    
}
