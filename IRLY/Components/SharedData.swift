//
//  SharedDocument.swift
//  IRLY
//
//  Created by Aaditya Parmar on 14/05/24.
//

import Foundation
import SwiftUI

class SharedData: ObservableObject {
    @Published var userMessage: String = ""
}
