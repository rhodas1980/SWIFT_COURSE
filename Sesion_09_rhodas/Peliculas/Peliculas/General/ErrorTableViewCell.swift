//
//  ErrorTableViewCell.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 19/06/22.
//

import UIKit

class ErrorTableViewCell: UITableViewCell {
    @IBOutlet private weak var lblErrorMessage: UILabel!
    
    func updateData(_ errorMessage: String) {
        self.lblErrorMessage.text = errorMessage
    }
}

extension ErrorTableViewCell {
    //creacion de un metodo de clase
    class func createIn(_ tableView: UITableView, indexPath: IndexPath, errorMessage: String) -> ErrorTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ErrorTableViewCell", for: indexPath) as? ErrorTableViewCell
        cell?.updateData(errorMessage)
        return cell ?? ErrorTableViewCell()
        
    }
}
