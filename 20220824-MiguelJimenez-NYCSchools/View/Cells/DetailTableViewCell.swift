//
//  DetailTableViewCell.swift
//  20220824-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 8/24/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var averageGradeLabel: UILabel!
    @IBOutlet weak var averageGradeProgressBar: UIProgressView!
    @IBOutlet weak var maxGradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
