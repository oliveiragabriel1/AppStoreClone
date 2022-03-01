import UIKit

// UICollectionViewDelegateFlowLayout para permitir trabalhar com tamanhos
class AppDetailsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let headerId = "headerId"
    let descriptionId = "descriptionId"
    let screenshotId = "screenshotId"

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }


    required init?(coder: NSCoder) {
        fatalError()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never

        collectionView.backgroundColor = .white
        collectionView.register(AppDetailsHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppDetailsDescriptionCell.self, forCellWithReuseIdentifier: descriptionId)
        collectionView.register(AppDetailsScreenshotCell.self, forCellWithReuseIdentifier: screenshotId)
    }


}


extension AppDetailsVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetailsHeaderCell
            return cell
        }

        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionId, for: indexPath) as! AppDetailsDescriptionCell
            return cell
        }

        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId, for: indexPath) as! AppDetailsScreenshotCell

            cell.backgroundColor = .red
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let width: CGFloat = view.bounds.width
        var height: CGFloat = 170

        if indexPath.item == 1 {
            let descriptionCell = AppDetailsDescriptionCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))

            descriptionCell.layoutIfNeeded()
            let estimatedSizeCell = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))

            height = estimatedSizeCell.height
        }

        if indexPath.item == 2 {
            height = 550
        }
        return .init(width: width, height: height)
    }
}
