//
//  CryptoHash.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 07/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

public enum Hash {
    case md5(Array<UInt8>)
    case sha1(Array<UInt8>)
    case sha224(Array<UInt8>), sha256(Array<UInt8>), sha384(Array<UInt8>), sha512(Array<UInt8>)
    case crc32(Array<UInt8>)
    case crc16(Array<UInt8>)
    
    public func calculate() -> [UInt8] {
        switch self {
        case md5(let bytes):
            return MD5(bytes).calculate()
        case sha1(let bytes):
            return SHA1(bytes).calculate()
        case sha224(let bytes):
            return SHA2(bytes, variant: .sha224).calculate32()
        case sha256(let bytes):
            return SHA2(bytes, variant: .sha256).calculate32()
        case sha384(let bytes):
            return SHA2(bytes, variant: .sha384).calculate64()
        case sha512(let bytes):
            return SHA2(bytes, variant: .sha512).calculate64()
        case crc32(let bytes):
            return CRC().crc32(bytes).bytes()
        case crc16(let bytes):
            return UInt32(CRC().crc16(bytes)).bytes(2)
        }
    }
}