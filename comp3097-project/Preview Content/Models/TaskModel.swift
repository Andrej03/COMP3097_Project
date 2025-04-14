import Foundation
import SwiftUI

enum TaskStatus: String, CaseIterable, Identifiable, Codable {
    case done = "Done"
    case inProgress = "In Progress"
    case notFinished = "Not Finished"
    
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
