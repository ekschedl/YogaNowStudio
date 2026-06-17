//
//  CancelBookingResult.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

import Foundation

struct CancelBookingResult: Decodable {

    let creditsRemaining: Int
    let creditRefunded: Bool

    enum CodingKeys: String, CodingKey {
        case creditsRemaining = "credits_remaining"
        case creditRefunded = "credit_refunded"
    }
}
