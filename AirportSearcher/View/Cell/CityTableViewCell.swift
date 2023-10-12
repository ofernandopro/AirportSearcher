//
//  CityTableViewCell.swift
//  AirportSearcher
//
//  Created by Fernando on 03/09/23.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(usingViewModel viewModel: CityViewPresentable) {
        self.cityLabel.text = viewModel.city
        self.locationLabel.text = viewModel.location
        self.selectionStyle = .none
    }

}
