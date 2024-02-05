//
//  SchoolViewController.swift
//  20220824-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 8/24/22.
//

import UIKit


class SchoolViewController: UIViewController {
    

    @IBOutlet weak var schoolTableView: UITableView!
    
    private var schoolList: [School] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = UIColor.systemCyan

        schoolTableView.delegate = self
        schoolTableView.dataSource = self
        
        SchoolRequest().fetchSchools { [weak self] school in
            
            //Order the school list
            self?.schoolList = school.sorted(by: { $0.schoolName! < $1.schoolName!
            })
            DispatchQueue.main.async {
                self?.schoolTableView.reloadData()
            }
        }
    }
}

extension SchoolViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCell = tableView.dequeueReusableCell(withIdentifier: "schoolCell" , for: indexPath)
        
        var content = schoolCell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: "building.2.fill")
        content.text = schoolList[indexPath.item].schoolName
//        schoolCell.textLabel?.text =
        content.secondaryText = schoolList[indexPath.item].city
//        schoolCell.textlabel
        schoolCell.contentConfiguration = content
        return schoolCell
    }
}

extension SchoolViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let schoolDetailsVC = SchoolDetailsViewController()
        schoolDetailsVC.schoolCode = schoolList[indexPath.item].dbn ?? ""
        
        schoolDetailsVC.title = schoolList[indexPath.item].schoolName
        
        self.navigationController?.pushViewController(schoolDetailsVC, animated: true)
    }
}

