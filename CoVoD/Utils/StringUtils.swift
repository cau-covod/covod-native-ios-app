//
//  StringUtils.swift
//  CoVoD
//
//  Created by Fredrik on 3/23/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

extension String {
    public func pluralize(with n: Int) -> String {
        n == 1 ? self : "\(self)s"
    }
}
