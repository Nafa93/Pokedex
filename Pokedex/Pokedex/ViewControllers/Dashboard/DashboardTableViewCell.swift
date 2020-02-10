//
//  DashboardTableViewCell.swift
//  Pokedex
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 2/10/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

    func initWithNamedAPIResource(namedAPIResource: NamedAPIResource) {
        label.text = namedAPIResource.name
    }
}
