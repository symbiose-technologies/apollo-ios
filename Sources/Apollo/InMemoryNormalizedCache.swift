import Foundation

public final class InMemoryNormalizedCache: NormalizedCache {
  private var records: RecordSet

  public init(records: RecordSet = RecordSet()) {
    self.records = records
  }

  public func loadRecords(forKeys keys: Set<CacheKey>) throws -> [CacheKey: Record] {
    return keys.reduce(into: [:]) { result, key in
      result[key] = records[key]
    }
  }
  public func fetchKeys(matching pattern: String) throws -> [CacheKey] {
    let keys: [String] = []
    return keys
  }

  //[Fractal] Empty as we don't use the InMemory Cache
  public func fetchRecords(matching pattern: String) throws -> [CacheKey: Record] {
    return [CacheKey: Record]()
  }


  public func removeRecord(for key: CacheKey) throws {
    records.removeRecord(for: key)
  }
  
  public func merge(records newRecords: RecordSet) throws -> Set<CacheKey> {
    return records.merge(records: newRecords)
  }

  public func removeRecords(matching pattern: CacheKey) throws {
    records.removeRecords(matching: pattern)
  }

  public func clear() {
    records.clear()
  }
}
