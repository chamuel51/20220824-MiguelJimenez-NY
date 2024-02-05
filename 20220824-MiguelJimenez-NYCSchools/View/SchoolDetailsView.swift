//
//  SchoolDetailsView.swift
//  20220824-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 8/24/22.
//

import Foundation
import UIKit

class SchoolDetailsView: UIView {
    public var tableView = UITableView(frame: .zero, style: .plain)
    let cell = UITableViewCell()
    
    
    public override init(frame: CGRect ) {
        
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        addSubViews()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func addSubViews(){
        
        self.addSubview(tableView)
    }
    func setConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        //        //TableView constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .top, relatedBy: .equal, toItem: tableView.superview?.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0)]
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .leading, relatedBy: .equal, toItem: tableView.superview?.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0)]
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: tableView.superview?.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0)]
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: tableView.superview?.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)]
        
        self.addConstraints(constraints)
    }
}

