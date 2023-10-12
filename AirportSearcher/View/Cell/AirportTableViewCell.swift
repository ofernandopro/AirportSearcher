//
//  AirportTableViewCell.swift
//  AirportSearcher
//
//  Created by Fernando on 10/09/23.
//

import UIKit

class AirportTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var runwayLengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(usingViewModel viewModel: AirportViewPresentable) -> Void {
        nameLabel.text = viewModel.name
        distanceLabel.text = viewModel.formattedDistance
        countryLabel.text = viewModel.address
        runwayLengthLabel.text = viewModel.runwayLength
        self.selectionStyle = .none
    }
    
}
