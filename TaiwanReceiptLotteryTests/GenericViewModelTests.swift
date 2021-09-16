//
//  GenericViewModelTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/15.
//

import XCTest

protocol CommonModel {
    var commonField: String { get }
}

struct SpecializedModel1: CommonModel {
    let commonField: String
}

struct SpecializedModel2: CommonModel {
    let commonField: String
}

protocol ViewModel {
    var title: String { get }
    var body: String { get }
}

struct AnyViewModel<Model: CommonModel>: ViewModel {
    let model: Model
    
    var title: String {
        "default title"
    }
    
    var body: String {
        "default body"
    }
}

extension AnyViewModel where Model == SpecializedModel1 {
    var title: String {
        "specialized title 1, \(model.commonField)"
    }
}

extension AnyViewModel where Model == SpecializedModel2 {
    var body: String {
        "specialized body 2, \(model.commonField)"
    }
}

class ViewModelTests: XCTestCase {
    
    /// test passed
    func test_presentSpecializedModel1() {
        let sut = AnyViewModel(model: SpecializedModel1(commonField: "sp1"))
        XCTAssertEqual(sut.title, "specialized title 1, sp1", "title")
        XCTAssertEqual(sut.body, "default body")
    }
    
    /// test passed
    func test_presentSpecializedModel2() {
        let sut = AnyViewModel(model: SpecializedModel2(commonField: "sp2"))
        XCTAssertEqual(sut.title, "default title", "title")
        XCTAssertEqual(sut.body, "specialized body 2, sp2", "body")
    }
    
    /// test failed
    func test_presentSpecializedModels() {
        let models: [CommonModel] = [SpecializedModel1(commonField: "sp1"), SpecializedModel2(commonField: "sp2")]
        let sut = makeViewModels(from: models)
        
        let titles = sut.map { $0.title }
        let bodys = sut.map { $0.body }
        
        // XCTAssertEqual failed: ("["default title", "default title"]") is not equal to ("["specialized title 1, sp1", "default title"]") - titles
        XCTAssertEqual(titles, ["specialized title 1, sp1", "default title"], "titles")
        
        // XCTAssertEqual failed: ("["default body", "default body"]") is not equal to ("["default body", "specialized body 2, sp2"]") - bodys
        XCTAssertEqual(bodys, ["default body", "specialized body 2, sp2"], "bodys")
    }
    
    private func makeViewModels(from models: [CommonModel]) -> [ViewModel] {
        return models.compactMap { model in
            switch model {
            case let sp1 as SpecializedModel1:
                return AnyViewModel(model: sp1)
                
            case let sp2 as SpecializedModel2:
                return AnyViewModel(model: sp2)
                
            default:
                return nil
            }
        }
    }
    
}
