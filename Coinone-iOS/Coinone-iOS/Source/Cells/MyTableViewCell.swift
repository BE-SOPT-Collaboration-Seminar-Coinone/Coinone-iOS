//
//  MyTableViewCell.swift
//  Coinone-iOS
//
//  Created by 김지수 on 2021/05/19.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier : String = "MyTableViewCell"
    
    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var CompanyName: UILabel!
    @IBOutlet weak var CompanyNameKR: UILabel!
    @IBOutlet weak var Ratenum: UILabel!
    @IBOutlet weak var RiseRate: UILabel!
    @IBOutlet weak var riseImage: UIImageView!
    @IBOutlet weak var CompareRiseRate: UILabel!
    @IBOutlet weak var graphImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(    logoImage : String,
                     companyName : String,
                     companyNameKR : String,
                     ratenum : String,
                     riseRate : String,
                     RiseImage : String,
                     compareRiseRate : String,
                     GraphImage : String
                     )
        {
            if let
                image = UIImage(named: logoImage)
            
            
           
            {
                LogoImage.image = image
            
            }
           if let
                image = UIImage(named : RiseImage)
           {
                riseImage.image = image
           }
            if let
                image = UIImage(named : GraphImage)
            {
                graphImage.image = image
            }
                    
            CompanyName.text = companyName
            CompanyNameKR.text = companyNameKR
            Ratenum.text = ratenum
            RiseRate.text = riseRate
            CompareRiseRate.text = compareRiseRate
       
        }

}
