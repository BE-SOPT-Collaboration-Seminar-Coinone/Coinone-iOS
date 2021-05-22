
//  StockTVC.swift
//  Coinone-iOS
//
//  Created by soyeon on 2021/05/16.
//
import UIKit
import SnapKit

class StockTVC: UITableViewCell {
    static let identifier = "StockTVC"
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.applyShadow()
        
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage()
        imageView.image = UIImage(named: "coinLogo")
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        label.textColor = .black
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Medium", size: 10)
        label.textColor = UIColor(red: 173.0 / 255.0, green: 179.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    private let curValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        label.textColor = UIColor(red: 23.0 / 255.0, green: 97.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.textColor = UIColor(red: 23.0 / 255.0, green: 97.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
        
        return label
    }()
    
    private let transPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
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
        contentView.addSubview(backView)
        
        backView.addSubview(logoImage)
        backView.addSubview(titleLabel)
        backView.addSubview(subTitleLabel)
        backView.addSubview(curValueLabel)
        backView.addSubview(rateLabel)
        backView.addSubview(transPriceLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        backView.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(60)
            make.top.equalTo(contentView).inset(6)
            make.leading.trailing.equalTo(contentView).inset(20)
        }
        
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(12)
            make.top.equalTo(backView.snp.top).inset(18)
            make.leading.equalTo(backView.snp.leading).inset(13)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(14)
            make.leading.equalTo(backView.snp.leading).inset(35)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(34)
            make.leading.equalTo(backView.snp.leading).inset(35)
        }
        
        curValueLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(22)
            make.leading.equalTo(backView.snp.leading).inset(150)
            make.height.equalTo(17)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(22)
            make.leading.equalTo(backView.snp.leading).inset(221)
            make.height.equalTo(17)
        }
        
        transPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(22)
            make.leading.equalTo(backView.snp.leading).inset(279)
            make.height.equalTo(17)
        }
    }
}

extension StockTVC {
    func setData(coinLogoImageName: String, coinEnglishTitle: String, coinKoreanTitle: String, coinCurrentPrice: Float, riseOrDescent: String, percentage: Float, coinTotalPrice: Float) {
        let formatter = NumberFormatter().then {
          $0.numberStyle = .decimal
        }
        
        self.logoImage.image = UIImage(named: coinLogoImageName)
        self.titleLabel.text = coinEnglishTitle
        self.subTitleLabel.text = coinKoreanTitle
        
        
        if riseOrDescent == "+" {
            self.curValueLabel.setLabel(text: "\(formatter.string(from: NSNumber(value: coinCurrentPrice))!)", textColor: .textRed, font: .boldSystemFont(ofSize: 14))
            self.rateLabel.setLabel(text: "\(riseOrDescent)\(percentage)%", textColor: .textRed, font: .systemFont(ofSize: 14, weight: .regular))
        } else {
            self.curValueLabel.setLabel(text: "\(formatter.string(from: NSNumber(value: coinCurrentPrice))!)", textColor: .mainBlue, font: .boldSystemFont(ofSize: 14))
            self.rateLabel.setLabel(text: "\(riseOrDescent)\(percentage)%", textColor: .mainBlue, font: .systemFont(ofSize: 14, weight: .regular))
        }
        
        self.transPriceLabel.setLabel(text: "\(formatter.string(from: NSNumber(value:coinTotalPrice))!)억", textColor: .coinGray, font: .systemFont(ofSize: 14, weight: .regular))
        
    }
}

