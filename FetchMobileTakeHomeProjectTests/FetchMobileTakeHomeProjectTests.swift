//
//  FetchMobileTakeHomeProjectTests.swift
//  FetchMobileTakeHomeProjectTests
//
//  Created by Carlos Cortes Escobar on 4/30/25.
//

import Testing
import XCTest
@testable import FetchMobileTakeHomeProject

struct FetchMobileTakeHomeProjectTests {
    
    @Test func testRecipeViewModelInit() {
        let service = MockRecipeService()
        let viewModel = RecipeViewModel(service: service)
        #expect(viewModel != nil)
    }

}

// XCTesting more widely used, more mature than Swift Testing so I will continue with that

class FetchMobileTakeHomeProjectTestsXC: XCTestCase {
    
    func testRecipeViewModelInit() {
        let service = MockRecipeService()
        let viewModel = RecipeViewModel(service: service)
        
        XCTAssertNotNil(viewModel, "ViewModel not nil")
    }
    
    func testRecipeViewModelFetchesRecipesAndCuisines() async {
        let service = MockRecipeService()
        service.mockData = mockValidRecipeData
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchAllRecipes()
        XCTAssertTrue(viewModel.recipes.count > 0)
        XCTAssertTrue(viewModel.cuisines.count > 0)
        XCTAssertFalse(viewModel.recipes.isEmpty)
        XCTAssertFalse(viewModel.cuisines.isEmpty)
    }
    
    func testRecipeFetchWithInvalidJSON() async {
        let service = MockRecipeService()
        service.mockData = mockMalformedData
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchAllRecipes()
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertTrue(viewModel.cuisines.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, RecipeAPIError.jsonParsingError.customDescription)
    }
    
    func testRecipeFetchWithEmptyData() async {
        let service = MockRecipeService()
        service.mockData = mockEmptyData
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchAllRecipes()
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, RecipeAPIError.emptyDataError.customDescription)
        
    }
    
    func testRecipeViewModelCuisinesAreAlphabetical() async {
        let service = MockRecipeService()
        service.mockData = mockValidRecipeData
        let viewModel = RecipeViewModel(service: service)
        
        await viewModel.fetchAllRecipes()
        XCTAssertEqual(viewModel.cuisines, Array(Set( viewModel.recipes.map { $0.cuisine })).sorted())
    }
    
}
