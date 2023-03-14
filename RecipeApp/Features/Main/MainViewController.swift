import UIKit

enum MainItem: Hashable {
    case trending(Recipe)
    case popular(Recipe)
    case recent(Recipe)
}

struct MainRow: Hashable {
    var index: Int
    var title: String
    var items: [MainItem]
}

enum MainSection: Int, CaseIterable {
    case trending
    case popular
    case recent
}

struct MainContent {
    let trendings: [Recipe]
    let populars: [Recipe]
    let recents: [Recipe]
}

private typealias DataSource = UICollectionViewDiffableDataSource<MainRow, MainItem>
private typealias Snapshot = NSDiffableDataSourceSnapshot<MainRow, MainItem>

final class MainViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(TrendignCollectionViewCell.self,
                                forCellWithReuseIdentifier: TrendignCollectionViewCell.id)
        collectionView.register(PopularRecipeCollectionViewCell.self,
                                forCellWithReuseIdentifier: PopularRecipeCollectionViewCell.id)
        collectionView.register(RecentRecipeCollectionViewCell.self,
                                forCellWithReuseIdentifier: RecentRecipeCollectionViewCell.id)
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.id)
        return collectionView
    }()
    
    private var dataSource: DataSource!
    private var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        let searchController = UISearchController()
        searchController.isActive = true
        searchController.searchBar.placeholder = "Search recipes"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let margin = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: margin.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
        ])
        configureDataSouce()
        reloadData()
    }
    
    private func configureDataSouce() {
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let item = self.viewModel.rows[indexPath.section].items[indexPath.row]
            switch item {
            case let .trending(recipe): return self.configure(TrendignCollectionViewCell.self, with: recipe, for: indexPath)
            case let .popular(recipe): return self.configure(PopularRecipeCollectionViewCell.self, with: recipe, for: indexPath)
            case let .recent(recipe): return self.configure(RecentRecipeCollectionViewCell.self, with: recipe, for: indexPath)
            }
        }
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath) as! SectionHeaderView
            headerView.title.text = self?.viewModel.rows[indexPath.section].title
            return headerView
        }
    }
    
    private func reloadData() {
        var snapshot = Snapshot()
        let rows = viewModel.rows
        snapshot.appendSections(rows)
        rows.forEach {
            snapshot.appendItems($0.items, toSection: $0)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with recipe: Recipe, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.id, for: indexPath) as? T
        else { fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: recipe)
        return cell
    }
}

final class MainViewModel {
    var mainContent: MainContent? {
        didSet {
            rows = [
                MainRow(
                    index: MainSection.trending.rawValue,
                    title: "Trending now 🔥",
                    items: (mainContent?.trendings ?? []).map { .trending($0)}),
                MainRow(
                    index: MainSection.popular.rawValue,
                    title: "Popular category ",
                    items: (mainContent?.populars ?? []).map { .popular($0)}),
                MainRow(
                    index: MainSection.recent.rawValue,
                    title: "Recent recipe",
                    items: (mainContent?.recents ?? []).map { .recent($0)}),
            ]
        }
    }
    var rows: [MainRow] = [
        MainRow(
            index: MainSection.trending.rawValue,
            title: "Trending now 🔥",
            items: APIClient.shared.getRecipes().map { .trending($0)}),
        MainRow(
            index: MainSection.popular.rawValue,
            title: "Popular category ",
            items: APIClient.shared.getRecipes().reversed().map { .popular($0)}),
        MainRow(
            index: MainSection.recent.rawValue,
            title: "Recent recipe",
            items: APIClient.shared.getRecipes().map { .recent($0)}),
    ]
}

// MARK: - Create ...
extension MainViewController {
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout =  UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = MainSection.allCases[sectionIndex]
            switch section {
            case .trending: return self.createTrendingSection()
            case .popular: return self.createPopularSection()
            case .recent: return self.createRecentSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    func createTrendingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(254))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        section.boundarySupplementaryItems = [createSectionHeader()]
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createPopularSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let bannerItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let bannerGroupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(150),
            heightDimension: .absolute(231)
        )
        let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
        
        let section = NSCollectionLayoutSection(group: bannerGroup)
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createRecentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let bannerItem = NSCollectionLayoutItem(layoutSize: itemSize)
        bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let bannerGroupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(124),
            heightDimension: .absolute(190)
        )
        let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
        
        let section = NSCollectionLayoutSection(group: bannerGroup)
        section.interGroupSpacing = 10
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createTeamSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let bannerItem = NSCollectionLayoutItem(layoutSize: itemSize)
        bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let bannerGroupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(110),
            heightDimension: .absolute(136)
        )
        let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
        
        let section = NSCollectionLayoutSection(group: bannerGroup)
        section.interGroupSpacing = 10
//        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(54)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        return layoutSectionHeader
    }
}
