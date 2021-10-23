//
//  MainViewModel.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias CoinbaseResultBlock = (Result<CoinbaseLatestData, ErrorResponse>) -> Void
typealias CoinbaseResult = Result<CoinbaseLatestData, ErrorResponse>

class MainViewModel {
    
    private var formatter: MainViewDataFormatterProtocol
    private let authManager: AuthenticationManagerProtocol
    
    private var loginStateListener: BooleanBlock?
    private var state: MainViewStateBlock?
    
    init(formatter: MainViewDataFormatterProtocol,
         authManager: AuthenticationManagerProtocol) {
        self.formatter = formatter
        self.authManager = authManager
    }
    
    func subscribeViewState(with completion: @escaping (MainViewState) -> Void) {
        state = completion
    }
    
    func subscribeLoginState(with completion: @escaping BooleanBlock) {
        loginStateListener = completion
    }
    
    func getData() {
        state?(.loading)
        do {
            guard let urlRequest = try? CoinbaseApiServiceProvider(request: getRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
    }
    
    // MARK: - Private Methods
    private func listenUserState() {
        authManager.isLoggedIn(with: isLoggedInListener)
    }
    
    private func fireApiCall(with urlRequest: URLRequest, with completion: @escaping CoinbaseResultBlock) {
        APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
    }
    
    //"builder" function to return request to be made to the server.
    private func getRequest() -> BaseRequest {
        return BaseRequest(apiKey: CredentialsProvider.shared.getApiKey(),
                           offset: formatter.paginationData.offset,
                           limit: formatter.paginationData.limit)
    }
    
    private func apiCallHandler(from response: CoinbaseLatestData) {
        formatter.setData(with: response)
        state?(.done)
    }
    
    private func loggedInListenerHandler(with value: Bool) {
        if value {
            getData()
        }
    }
    
    // MARK: - Listener handlers
    
    private lazy var isLoggedInListener: BooleanBlock = { [weak self] value in
        print("test : \(value)")
        self?.loggedInListenerHandler(with: value)
    }
    
    private lazy var dataListener: CoinbaseResultBlock = { [weak self] result in
        self?.formatter.paginationData.fetching = false
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
}

extension MainViewModel: CoinTableViewProtocol {
    func isLoadingCell(for index: Int) -> Bool {
        return false
    }
    
    func getMoreData() {
        guard formatter.paginationData.checkLoadingMore(with: formatter.getNumberOfItemsRetrieved()) else { return }
        formatter.paginationData.nextOffset()
        getData()
    }
    
    func askNumberOfSection() -> Int {
        return 1
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return formatter.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return formatter.getItem(at: index)
    }
}
