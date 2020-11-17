import LogDog
@testable import LogDogChalk
import XCTest

func test(_ logger: Logger) {
    logger.t("POST /users", metadata: ["body": ["name": "秋"]])

    logger.d("got response", metadata: ["message": "ok"])

    logger.i("request success")

    let date: Date? = Date()
    logger.n("latency too long", metadata: ["latency": .any(100), "some": ["date": .any(date as Any)]])

    logger.w("no connection")

    logger.e("bad response", metadata: ["url": .any("/me"), "status_code": .any(404)])

    logger.c("can not connect to db")
}

final class LogDogChalkTests: XCTestCase {
    func testExample() {
        let logger = Logger(label: "App") { label in
            let sink = LogSinks.BuiltIn.medium.suffix("\n").color()
            return SugarLogHandler(label: label, sink: sink, appender: TextLogAppender.stdout)
        }

        test(logger)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
