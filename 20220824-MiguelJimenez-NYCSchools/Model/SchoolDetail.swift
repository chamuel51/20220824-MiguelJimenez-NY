//
//  SchoolDetail.swift
//  20220824-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 8/24/22.
//

import Foundation

// MARK: - SchoolDetail
struct SchoolDetail: Codable {
    var dbn: String?
    var schoolName: String?
    var numberOfTakers: String?
    var readingScore: String?
    var mathScore: String?
    var writingScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case numberOfTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
    
    init(dbn: String?, schoolName: String,numberOfTakers: String, readingScore: String, mathScore: String, writingScore: String) {
        self.dbn = dbn
        self.schoolName = schoolName
        self.numberOfTakers = numberOfTakers
        self.readingScore = readingScore
        self.writingScore = writingScore
        self.mathScore = mathScore
    }
    
}
