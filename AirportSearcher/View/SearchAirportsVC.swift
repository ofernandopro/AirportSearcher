//
//  SearchAirportsVC.swift
//  AirportSearcher
//
//  Created by Fernando on 01/09/23.
//

import UIKit
import RxSwift
import RxDataSources

class SearchAirportsVC: UIViewController, Storyboardable {
    
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchAirportsViewPresentable!
    var viewModelBuilder: SearchAirportsViewPresentable.ViewModelBuilder!
    
    private static let CellId = "CityTableViewCell"
    private let bag = DisposeBag()
    
    private lazy var datasource = RxTableViewSectionedReloadDataSource<CityItemsSection>(configureCell: { _, tableView, indexPath, item in
        
        let cityCell = tableView.dequeueReusableCell(withIdentifier: SearchAirportsVC.CellId, for: indexPath) as! CityTableViewCell
        cityCell.configure(usingViewModel: item)
        return cityCell
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = viewModelBuilder((
            searchText: searchTextField.rx.text.orEmpty.asDriver(),
            citySelect: tableView.rx.modelSelected(CityViewModel.self).asDriver()
        ))
        setupUI()
        setupBinding()
    }

}

private extension SearchAirportsVC {
    
    func setupUI() -> Void {
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: SearchAirportsVC.CellId)
        self.title = "Airports"
    }
    
    func setupBinding() -> Void {
        self.viewModel.output.cities
            .drive(tableView.rx.items(dataSource: self.datasource))
            .disposed(by: bag)
    }
 
}
