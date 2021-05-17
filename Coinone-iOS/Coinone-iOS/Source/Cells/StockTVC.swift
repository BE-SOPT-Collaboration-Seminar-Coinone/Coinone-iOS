//
//  StockTVC.swift
//  Coinone-iOS
//
//  Created by soyeon on 2021/05/16.
//

import UIKit
import SnapKit

class StockTVC: UITableViewCell {
    static let identifier = "StockTVC"
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage()
        imageView.image = UIImage(named: "xrp1")
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = UIColor(red: 173.0 / 255.0, green: 179.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    private let curValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 23.0 / 255.0, green: 97.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 23.0 / 255.0, green: 97.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    private let transPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 173.0 / 255.0, green: 179.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConfigure()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension StockTVC {
    func setConfigure() {
        contentView.addSubview(logoImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(curValueLabel)
        contentView.addSubview(rateLabel)
        contentView.addSubview(transPriceLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(12)
            make.top.equalTo(contentView.snp.top).inset(19)
            make.leading.equalTo(contentView.snp.leading).inset(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(14)
            make.leading.equalTo(contentView.snp.leading).inset(51)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(34)
            make.leading.equalTo(contentView.snp.leading).inset(51)
        }
        
        curValueLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(22)
            make.leading.equalTo(contentView.snp.leading).inset(170)
            make.bottom.equalTo(contentView.snp.bottom).inset(21)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(22)
            make.leading.equalTo(contentView.snp.leading).inset(231)
            make.bottom.equalTo(contentView.snp.bottom).inset(21)
        }
        
        transPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(22)
            make.leading.equalTo(contentView.snp.leading).inset(299)
            make.bottom.equalTo(contentView.snp.bottom).inset(21)
        }
    }
}

extension StockTVC {
    func setData(logoPath: String, title: String, subTitle: String, curValue: String, rate: String, transPrice: Int) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        curValueLabel.text = curValue
        rateLabel.text = rate
        transPriceLabel.text = "\(transPrice)억"
    }
}
