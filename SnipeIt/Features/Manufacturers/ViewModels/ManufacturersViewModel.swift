//
//  ManufacturersViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class ManufacturersViewModel: ObservableObject {
    @Published var manufacturers: [Manufacturer] = []
    
    let service = SnipeItServiceAPI(config: SnipeItAPIConfig(baseURL: "http://storage.turing/", token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjlhN2VkNzUyMTRjNDM5NTViMjc0M2Y2MzQ1NjhiMDA0MzI3ODNhNWNiMzBkYzQyY2Y0YjgxNDZmM2FmZGMyODg1ZmQwZDkwZTFkZjA5YzQiLCJpYXQiOjE2NzM2NTYxMzUuMTU2ODYzLCJuYmYiOjE2NzM2NTYxMzUuMTU2ODY4LCJleHAiOjIzMDQ4MDgxMzUuMDg3NDc5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.QIvUlQpeYgm6oDbCl8_s9aAe4VeyRNaESmJ8oXVcHWEB8x_gzC_KbWWUpUEL1ezvSzYyEJ64J1-W9zQ7gi-DCNrW9itCpmTl6chAxPSEW1DYdL3Bw8mQFBRKQ-a-3viaCp6Ggea9ejcbGhbxvEWWJLSPTO6jyCUCF3JOjHnJXUnkyFmG9b3CqaiWoHVN1b2iHJqd3aIgXpJcr9RRkjKOZ8Hzol2tbteCdb4QkZZo2aC0HXID9UcuHM1r0dLn-g5yB7kyhtqnGQr_6GRnoIhXGgyhjJ_1cOHOyUk8Cu_vjeHKmhhS2_2A8eyejJBRlPctkIxY-Mv3hOTUemW-YPPgbT8YbwYy4ZqUaI0N3JiOTozMN7FXmJ6BtcJcqOKiOO9OaoqDSNBVf68iUkGSVK3xuAhvRRw6aPz_X-MJMd5E-s740_Q03CSqXYbviqcDYr2ZMCLhqNJhDvja7--wVtZ9Ti13FWcMyHJXbdUkgEkI725VRsTXR5gilLQz1lmQ22TXrR9VC-AwwKnjmzQ9dZ3ZdubgpE9IHjN3Dh12BIW1WZRuO2nzpz2G_YGCq8EUTF_ay0WsnAL2JWcwzn7jJ7CFWv9AIjYnwibYUFjPt06krgAYLoYJCf57LdN4HB45FKShCTVBLdmqhBsGaWeH6kJ2BDd4kgvLGrQWVnwFHXXxx68"))
    
    @MainActor
    func fetch() {
        Task {
            do {
                manufacturers = try await service.manufacturers.fetch().rows
            } catch let error {
                print(error)
            }
        }
    }
}
