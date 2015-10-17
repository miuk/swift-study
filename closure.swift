print([1,2,3].map({ (number: Int) -> Int in
                      let result = 3 * number
                      return result
                  }))
/*
print([1,2,3].map({ number in
                      let result = 3 * number
                      return result
                    }))
*/
print([1,2,3].map({ number in 3 * number}))
print([1,2,3].map({ 3 * $0}))
print([1,2,3].map(){ 3 * $0})
print([1,2,3].map{ 3 * $0})
