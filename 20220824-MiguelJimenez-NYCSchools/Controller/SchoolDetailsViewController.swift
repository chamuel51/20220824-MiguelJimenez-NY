//
//  SchoolDetailsViewController.swift
//  20220824-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 8/24/22.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    var schoolDetail: SchoolDetail? = nil
    var schooolDetailsTuple : [(description: String,value: String?)] = []
    var schoolCode  = ""
    lazy var schoolDetailCell = DetailTableViewCell()
    let schoolDetailID = "DetailTableViewCell"
    var schoolDetailsView = SchoolDetailsView()
    override func loadView() {
        view = schoolDetailsView
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        SchoolRequest().fetchSchoolDetails(self.schoolCode) { [weak self] schoolDetail in
            self?.schoolDetail = schoolDetail
            DispatchQueue.main.async {
                self?.schooolDetailsTuple.append(contentsOf: [("Math Grades",  self?.schoolDetail?.mathScore),("Writing Grades",  self?.schoolDetail?.writingScore),("Reading Grades",  self?.schoolDetail?.readingScore)])
                
                self?.schoolDetailsView.tableView.reloadData()
            }
            
        }
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolDetailsView.tableView.register(UINib.init(nibName: schoolDetailID, bundle: nil), forCellReuseIdentifier: schoolDetailID)
        schoolDetailsView.tableView.rowHeight = 70
        schoolDetailsView.tableView.dataSource = self
        
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .black
//        label.text = "This is a\nmultiline string for the navBar"
        self.navigationItem.titleView = label
    }
}

extension SchoolDetailsViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schooolDetailsTuple.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCell = tableView.dequeueReusableCell(withIdentifier: schoolDetailID , for: indexPath) as? DetailTableViewCell
        
        schoolCell?.titleLabel.text = self.schooolDetailsTuple[indexPath.item].description
        schoolCell?.averageGradeLabel.text = self.schooolDetailsTuple[indexPath.item].value
        schoolCell?.maxGradeLabel.text = String(800)
        schoolCell?.averageGradeProgressBar.setProgress(Float(self.schooolDetailsTuple[indexPath.item].value ?? "")!/800, animated: true)
        
        return schoolCell!
    }
        
}
