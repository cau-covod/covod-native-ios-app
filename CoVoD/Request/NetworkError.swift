//
//  NetworkError.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case couldNotCreateURL(URLComponents)
    case invalidAddress(String, Int32)
    case ioError(Error)
    case missingData
    case notUTF8(Data)
    case jsonDecodingError(String)
}
