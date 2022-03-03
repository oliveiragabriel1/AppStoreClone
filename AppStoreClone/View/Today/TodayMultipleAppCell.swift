import UIKit


class TodayMultpleAppCell: UITableViewCell {


    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa



            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView(width: 48, height: 48)

    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 16)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)

    let button: UIButton = .makeButton()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 4
        titleCompanyStackView.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView, button])

        stackView.spacing = 16
        stackView.alignment = .center


        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 14, left: 0, bottom: 14, right: 0))
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
