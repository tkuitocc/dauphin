import CoreLocation

struct L2GData: Identifiable {
    let id: String
    let code: String
    let name: String
    let coordinate: CLLocationCoordinate2D

    init(
        id: String,
        code: String,
        name: String,
        coordinate: CLLocationCoordinate2D
    ) {
        self.id = id
        self.code = code
        self.name = name
        self.coordinate = coordinate
    }
}

let letterLocations: [String: L2GData] = [
    "-": L2GData(
        id: "-",
        code: "ZZZ",
        name: "書卷廣場",
        coordinate: .init(latitude: 25.17553, longitude: 121.45063)
    ),
    "A": L2GData(
        id: "A",
        code: "A",
        name: "行政大樓",
        coordinate: .init(latitude: 25.174847, longitude: 121.449139)
    ),
    "B": L2GData(
        id: "B",
        code: "B",
        name: "商管大樓",
        coordinate: .init(latitude: 25.1763683, longitude: 121.4499566)
    ),
    "C": L2GData(
        id: "C",
        code: "C",
        name: "鍾靈化學館",
        coordinate: .init(latitude: 25.1751403, longitude: 121.4488896)
    ),
    "CH": L2GData(
        id: "CH",
        code: "CH",
        name: "覺軒會館",
        coordinate: .init(latitude: 25.173741, longitude: 121.4484968)
    ),
    "D": L2GData(
        id: "D",
        code: "D",
        name: "臺北校園大樓",
        coordinate: .init(latitude: 25.0311998, longitude: 121.5283242)
    ),
    "DR": L2GData(
        id: "DR",
        code: "DR",
        name: "白樓",
        coordinate: .init(latitude: 25.1736572, longitude: 121.4488002)
    ),
    "E": L2GData(
        id: "E",
        code: "E",
        name: "工學大樓",
        coordinate: .init(latitude: 25.1759529, longitude: 121.4515456)
    ),
    "ED": L2GData(
        id: "ED",
        code: "ED",
        name: "教育大樓",
        coordinate: .init(latitude: 25.1757271, longitude: 121.4526171)
    ),
    "F": L2GData(
        id: "F",
        code: "F",
        name: "會文館",
        coordinate: .init(latitude: 25.1756375, longitude: 121.4495702)
    ),
    "FL": L2GData(
        id: "FL",
        code: "FL",
        name: "外國語文大樓",
        coordinate: .init(latitude: 25.1748889, longitude: 121.4516784)
    ),
    "G": L2GData(
        id: "G",
        code: "G",
        name: "工學館",
        coordinate: .init(latitude: 25.175975, longitude: 121.451065)
    ),
    "GA": L2GData(
        id: "GA",
        code: "GA",
        name: "大門管制站",
        coordinate: .init(latitude: 25.1738098, longitude: 121.4471171)
    ),
    "GB": L2GData(
        id: "GB",
        code: "GB",
        name: "藍白小鎮",
        coordinate: .init(latitude: 25.17674, longitude: 121.4504757)
    ),
    "GE": L2GData(
        id: "GE",
        code: "GE",
        name: "大忠管制站",
        coordinate: .init(latitude: 25.1764667, longitude: 121.4483198)
    ),
    "GO": L2GData(
        id: "GO",
        code: "GO",
        name: "勤務監控管制站",
        coordinate: .init(latitude: 25.17416, longitude: 121.451057)
    ),
    "H": L2GData(
        id: "H",
        code: "H",
        name: "宮燈教室",
        coordinate: .init(latitude: 25.17441, longitude: 121.4492821)
    ),
    "HC": L2GData(
        id: "HC",
        code: "HC",
        name: "守謙國際會議中心",
        coordinate: .init(latitude: 25.1746943, longitude: 121.4479357)
    ),
    "I": L2GData(
        id: "I",
        code: "I",
        name: "覺生綜合大樓",
        coordinate: .init(latitude: 25.174302, longitude: 121.450866)
    ),
    "J": L2GData(
        id: "J",
        code: "J",
        name: "麗澤國際學舍",
        coordinate: .init(latitude: 25.1761396, longitude: 121.447894)
    ),
    "K": L2GData(
        id: "K",
        code: "K",
        name: "建築館",
        coordinate: .init(latitude: 25.176404, longitude: 121.450936)
    ),
    "L": L2GData(
        id: "L",
        code: "L",
        name: "文學館",
        coordinate: .init(latitude: 25.1762736, longitude: 121.4494249)
    ),
    "M": L2GData(
        id: "M",
        code: "M",
        name: "海事博物館",
        coordinate: .init(latitude: 25.1760906, longitude: 121.4504526)
    ),
    "N": L2GData(
        id: "N",
        code: "N",
        name: "紹謨紀念游泳館",
        coordinate: .init(latitude: 25.1744117, longitude: 121.4472702)
    ),
    "O": L2GData(
        id: "O",
        code: "O",
        name: "傳播O館",
        coordinate: .init(latitude: 25.1755633, longitude: 121.4486355)
    ),
    "P": L2GData(
        id: "P",
        code: "P",
        name: "司令臺",
        coordinate: .init(latitude: 25.173943, longitude: 121.445709)
    ),
    "Q": L2GData(
        id: "Q",
        code: "Q",
        name: "傳播Q館",
        coordinate: .init(latitude: 25.1756679, longitude: 121.4491764)
    ),
    "R": L2GData(
        id: "R",
        code: "R",
        name: "學生活動中心",
        coordinate: .init(latitude: 25.1747467, longitude: 121.4500863)
    ),
    "RT": L2GData(
        id: "RT",
        code: "RT",
        name: "網球場",
        coordinate: .init(latitude: 25.1750254, longitude: 121.4502091)
    ),
    "S": L2GData(
        id: "S",
        code: "S",
        name: "騮先紀念科學館",
        coordinate: .init(latitude: 25.17528, longitude: 121.44823)
    ),
    "SG": L2GData(
        id: "SG",
        code: "SG",
        name: "紹謨紀念體育館",
        coordinate: .init(latitude: 25.176305, longitude: 121.44892)
    ),
    "SS": L2GData(
        id: "SS",
        code: "SS",
        name: "溜冰場",
        coordinate: .init(latitude: 25.175674, longitude: 121.4477146)
    ),
    "T": L2GData(
        id: "T",
        code: "T",
        name: "驚聲紀念大樓",
        coordinate: .init(latitude: 25.17542, longitude: 121.4510364)
    ),
    "U": L2GData(
        id: "U",
        code: "U",
        name: "覺生紀念圖書館",
        coordinate: .init(latitude: 25.174956, longitude: 121.4508912)
    ),
    "V": L2GData(
        id: "V",
        code: "V",
        name: "視聽教育館",
        coordinate: .init(latitude: 25.17494, longitude: 121.449397)
    ),
    "W": L2GData(
        id: "W",
        code: "W",
        name: "風洞實驗館",
        coordinate: .init(latitude: 25.17638, longitude: 121.451294)
    ),
    "X": L2GData(
        id: "X",
        code: "X",
        name: "五虎崗機車停車場",
        coordinate: .init(latitude: 25.175582, longitude: 121.4531627)
    ),
    "XC": L2GData(
        id: "XC",
        code: "XC",
        name: "五虎崗綜合球場",
        coordinate: .init(latitude: 25.1755207, longitude: 121.4536587)
    ),
    "Z": L2GData(
        id: "Z",
        code: "Z",
        name: "松濤館",
        coordinate: .init(latitude: 25.175008, longitude: 121.4519899)
    ),
    "ZF": L2GData(
        id: "ZF",
        code: "ZF",
        name: "淡江國際學園",
        coordinate: .init(latitude: 25.1776015, longitude: 121.4428487)
    ),
    "ZZZ-x-PE": L2GData(
        id: "ZZZ-x-PE",
        code: "ZZZ",
        name: "大忠街機車停車場",
        coordinate: .init(latitude: 25.176728, longitude: 121.447836)
    ),
]

private let defaultCoord = CLLocationCoordinate2D(latitude: 25.0478, longitude: 121.5170)

let campusLocations: [L2GData] = letterLocations.values.sorted { lhs, rhs in
    lhs.id.localizedStandardCompare(rhs.id) == .orderedAscending
}

func letterToCoordinate(for letter: String) -> CLLocationCoordinate2D {
    letterLocations[letter]?.coordinate ?? defaultCoord
}
