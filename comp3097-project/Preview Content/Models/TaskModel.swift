import Foundation
import SwiftUI

enum TaskStatus: String, CaseIterable, Identifiable, Codable {
    case done = "Done"
    case inProgress = "In Progress"
    case notFinished = "Not Finished"
    // custome type should be here
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .done:
            return .green
        case .inProgress:
            return .yellow
        case .notFinished:
            return .red
        }
    }
}

struct Task: Identifiable, Codable, Equatable {
    // Initialization of ID as a fieldof UUID as previously not initiated (Andrej)
    var id: UUID = UUID()
    var title: String
    var description: String = ""
    var dueDate: Date
    var status: TaskStatus
    
    var formattedDueDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: dueDate)
    }
}
