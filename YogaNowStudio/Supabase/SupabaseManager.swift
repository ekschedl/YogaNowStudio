//
//  SupabaseManager.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.
//

import Foundation
import Supabase

// MARK: - Supabase Manager

enum SupabaseManager {

    // MARK: Supabase Client

    static let client = SupabaseClient(
        supabaseURL: URL(
            string: "https://jmvjrdmpbppzwotgkizy.supabase.co"
        )!,
        supabaseKey: "sb_publishable_RcCzQ95SW2FAseaDWMd8LA__keHftV3"
    )
}
