////  CryptoSwift
//
//  Copyright (C) 2014-__YEAR__ Marcin Krzyżanowski <marcin@krzyzanowskim.com>
//  This software is provided 'as-is', without any express or implied warranty.
//
//  In no event will the authors be held liable for any damages arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
//  - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
//  - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
//  - This notice may not be removed or altered from any source or binary distribution.
//

import XCTest
@testable import CryptoSwift

class RipemdTests: XCTestCase {
    let data = Data([0x01, 0x02, 0x03])
    let words: [UInt32] = [2147680769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0]
    let result: [UInt8] = [74, 208, 69, 107, 241, 181, 192, 7, 87, 191, 72, 202, 239, 81, 30, 39]
    let resultHash: [UInt32] = [1799737418, 130070001, 3393765207, 656298479]
    let variant = Ripemd.Variant.ripemd128
    
    func testCompress() {
        var variantHash = variant.hash
        variant.compress(message: words, hash: &variantHash)
        XCTAssertEqual(resultHash, variantHash, "compress failured")
    }

    func testRipemd128() {
        XCTAssertEqual(result, data.ripemd128().map {UInt8($0)}, "ripemd 128 digest failure")
    }
}
