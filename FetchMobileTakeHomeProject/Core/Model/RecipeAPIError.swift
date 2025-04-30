//
//  RecipeAPIError.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

enum RecipeAPIError: Error {
    case invalidData
    case jsonParsingError
    case emptyDataError
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid recipe data"
        case .jsonParsingError: return "Failed to parse recipe JSON"
        case .emptyDataError: return "No recipes available right now, please try again later"
        case let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case let .unknownError(error): return "An unknown error occured: \(error)"
        }
    }
}
