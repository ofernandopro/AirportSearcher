//
//  AirportsVC.swift
//  AirportSearcher
//
//  Created by Fernando on 10/09/23.
//

import UIKit
import RxSwift
import RxDataSources

class AirportsVC: UIViewController, Storyboardable {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: AirportsViewPresentable!
    var viewModelBuilder: AirportsViewPresentable.ViewModelBuilder!
    
    private let bag = DisposeBag()
    
    private static let CellId = "AirportTableViewCell"
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<AirportItemsSection>(configureCell: { (_, tableView, indexPath, item) in
        let airportCell = tableView.dequeueReusableCell(withIdentifier: AirportsVC.CellId, for: indexPath) as! AirportTableViewCell
        airportCell.configure(usingViewModel: item)
        return airportCell
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = viewModelBuilder(())
        self.setupUI()
        self.setupBinding()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemPink
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        self.view.backgroundColor = .systemGray6
    }
    
}

private extension AirportsVC {
    
    func setupUI() -> Void {
        tableView.register(UINib(nibName: "AirportTableViewCell", bundle: nil), forCellReuseIdentifier: AirportsVC.CellId)
    }

    func setupBinding() -> Void {
        self.viewModel.output.airports
            .drive(self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        self.viewModel.output.title
            .drive(self.rx.title)
            .disposed(by: bag)
    }
    
}





