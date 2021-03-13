//
//  TestHelper.swift
//  LatestNewsTests
//
//  Created by Sherif Nasr on 13/03/2021.
//

import Foundation

public class TestHelper {
    /**
     get data from static Json
     - Parameter name: file name
     - Parameter extension: file extension
     */
    func loadStubDataFromBundle(name: String, extension: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: name, withExtension: `extension`)
        return try? Data(contentsOf: url!)
    }
}
