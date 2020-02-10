//
//  DashboardViewController.swift
//  Pokedex
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 2/10/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: DashboardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.delegate = self
        
        viewModel?.fetchData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DashboardTableViewCell", bundle: nil), forCellReuseIdentifier: "dashboardTableViewCell")
    }
}

protocol DashboardViewModelDelegate {
    func listFecthed()
}

class DashboardViewModel {
    var namedAPIResourceList: NamedAPIResourceList?
    var delegate: DashboardViewModelDelegate?
    
    public func fetchData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=40&limit=20") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            self.namedAPIResourceList = try? decoder.decode(NamedAPIResourceList.self, from: data)
            
            self.delegate?.listFecthed()
        }.resume()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.namedAPIResourceList?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardTableViewCell") as? DashboardTableViewCell else { return UITableViewCell() }
        
        cell.label?.text = viewModel?.namedAPIResourceList?.results?[indexPath.row].name
        
        return cell
    }
}

extension DashboardViewController: DashboardViewModelDelegate {
    func listFecthed() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
