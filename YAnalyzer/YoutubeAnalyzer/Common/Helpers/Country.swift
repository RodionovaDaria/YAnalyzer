//
//  Country.swift
//  NoName
//
//  Created by Dasha on 23.09.2021.
//

enum Country: String {
    
    static func flag(country: Country?) -> String {
        
        switch country {
        case .ad:
            return "🇦🇩"
        case .ae:
            return "🇦🇪"
        case .al:
            return "🇦🇱"
        case .am:
            return "🇦🇲"
        case .ao:
            return "🇦🇴"
        case .aq:
            return "🇦🇶"
        case .ar:
            return "🇦🇷"
        case .at:
            return "🇦🇹"
        case .au:
            return "🇦🇺"
        case .az:
            return "🇦🇿"
        case .be:
            return "🇧🇪"
        case .bg:
            return "🇧🇬"
        case .bo:
            return "🇧🇴"
        case .br:
            return "🇧🇷"
        case .by:
            return "🇧🇾"
        case .bz:
            return "🇧🇿"
        case .ca:
            return "🇨🇦"
        case .cf:
            return "🇨🇫"
        case .ch:
            return "🇨🇭"
        case .cl:
            return "🇨🇱"
        case .cn:
            return "🇨🇳"
        case .co:
            return "🇨🇴"
        case .cr:
            return "🇨🇷"
        case .cu:
            return "🇨🇺"
        case .cy:
            return "🇨🇾"
        case .cz:
            return "🇨🇿"
        case .de:
            return "🇩🇪"
        case .dk:
            return "🇩🇰"
        case .dj:
            return "🇩🇯"
        case .dm:
            return "🇩🇲"
        case .ec:
            return "🇪🇨"
        case .ee:
            return "🇪🇪"
        case .eg:
            return "🇪🇬"
        case .es:
            return "🇪🇸"
        case .et:
            return "🇪🇹"
        case .fi:
            return "🇫🇮"
        case .fj:
            return "🇫🇯"
        case .fr:
            return "🇫🇷"
        case .gb:
            return "🇬🇧"
        case .ge:
            return "🇬🇪"
        case .gn:
            return "🇬🇳"
        case .gp:
            return "🇬🇵"
        case .gr:
            return "🇬🇷"
        case .gt:
            return "🇬🇹"
        case .hk:
            return "🇭🇰"
        case .hn:
            return "🇭🇳"
        case .hr:
            return "🇭🇷"
        case .ht:
            return "🇭🇹"
        case .hu:
            return "🇭🇺"
        case .id:
            return "🇮🇩"
        case .ie:
            return "🇮🇪"
        case .il:
            return "🇮🇱"
        case .im:
            return "🇮🇲"
        case .ind:
            return "🇮🇳"
        case .iq:
            return "🇮🇶"
        case .ir:
            return  "🇮🇷"
        case .isl:
            return "🇮🇸"
        case .it:
            return "🇮🇹"
        case .jm:
            return "🇯🇲"
        case .jo:
            return "🇯🇴"
        case .jp:
            return "🇯🇵"
        case .ke:
            return "🇰🇪"
        case .kg:
            return "🇰🇬"
        case .kh:
            return "🇰🇭"
        case .kp:
            return "🇰🇵"
        case .kr:
            return "🇰🇷"
        case .kz:
            return "🇰🇿"
        case .lb:
            return "🇱🇧"
        case .lk:
            return "🇱🇰"
        case .lr:
            return "🇱🇷"
        case .lt:
            return "🇱🇹"
        case .lu:
            return "🇱🇺"
        case .lv:
            return "🇱🇻"
        case .ly:
            return "🇱🇾"
        case .ma:
            return "🇲🇦"
        case .mc:
            return "🇲🇨"
        case .md:
            return "🇲🇩"
        case .me:
            return "🇲🇪"
        case .mf:
            return "🇲🇫"
        case .mg:
            return "🇲🇬"
        case .mh:
            return "🇲🇭"
        case .mk:
            return "🇲🇰"
        case .ml:
            return "🇲🇱"
        case .mn:
            return "🇲🇳"
        case .mt:
            return "🇲🇹"
        case .mv:
            return "🇲🇻"
        case .mx:
            return "🇲🇽"
        case .my:
            return "🇲🇾"
        case .na:
            return "🇳🇦"
        case .ne:
            return "🇳🇪"
        case .ng:
            return "🇳🇬"
        case .nl:
            return "🇳🇱"
        case .no:
            return "🇳🇴"
        case .np:
            return "🇳🇵"
        case .nz:
            return "🇳🇿"
        case .pa:
            return "🇵🇦"
        case .pe:
            return "🇵🇪"
        case .pf:
            return "🇵🇫"
        case .pg:
            return "🇵🇬"
        case .ph:
            return "🇵🇭"
        case .pk:
            return "🇵🇰"
        case .pl:
            return "🇵🇱"
        case .pr:
            return "🇵🇷"
        case .ps:
            return "🇵🇸"
        case .pt:
            return "🇵🇹"
        case .py:
            return "🇵🇾"
        case .ro:
            return "🇷🇴"
        case .rs:
            return "🇷🇸"
        case .ru:
            return "🇷🇺"
        case .rw:
            return "🇷🇼"
        case .sa:
            return "🇸🇦"
        case .sb:
            return "🇸🇧"
        case .sc:
            return "🇸🇨"
        case .sd:
            return "🇸🇩"
        case .se:
            return "🇸🇪"
        case .sg:
            return "🇸🇬"
        case .si:
            return "🇸🇮"
        case .sk:
            return "🇸🇰"
        case .sm:
            return "🇸🇲"
        case .so:
            return "🇸🇴"
        case .sr:
            return "🇸🇷"
        case .ss:
            return "🇸🇸"
        case .sv:
            return "🇸🇻"
        case .sx:
            return "🇸🇽"
        case .th:
            return "🇹🇭"
        case .tj:
            return "🇹🇯"
        case .tm:
            return "🇹🇲"
        case .tn:
            return "🇹🇳"
        case .to:
            return "🇹🇴"
        case .tr:
            return "🇹🇷"
        case .tw:
            return "🇹🇼"
        case .tz:
            return "🇹🇿"
        case .ua:
            return "🇺🇦"
        case .ug:
            return "🇺🇬"
        case .us:
            return "🇺🇸"
        case .uy:
            return "🇺🇾"
        case .uz:
            return "🇺🇿"
        case .va:
            return "🇻🇦"
        case .ve:
            return "🇻🇪"
        case .vn:
            return "🇻🇳"
        case .ws:
            return "🇼🇸"
        case .ye:
            return "🇾🇪"
        case .za:
            return "🇿🇦"
        case .zm:
            return "🇿🇲"
        case .zw:
            return "🇿🇼"
        default:
            return "🏴‍☠️"
        }
    }
    
    case ad = "AD"
    case ae = "AE"
    case al = "AL"
    case am = "AM"
    case ao = "AO"
    case aq = "AG"
    case ar = "AR"
    case at = "AT"
    case au = "AU"
    case az = "AZ"
    case be = "BE"
    case bg = "BG"
    case bo = "BO"
    case br = "BR"
    case by = "BY"
    case bz = "BZ"
    case ca = "CA"
    case cf = "CF"
    case ch = "CH"
    case cl = "CL"
    case cn = "CN"
    case co = "CO"
    case cr = "CR"
    case cu = "CU"
    case cy = "CY"
    case cz = "CZ"
    case de = "DE"
    case dk = "DK"
    case dj = "DJ"
    case dm = "DM"
    case ec = "EC"
    case ee = "EE"
    case eg = "EG"
    case es = "ES"
    case et = "ET"
    case fi = "FI"
    case fj = "FJ"
    case fr = "FR"
    case gb = "GB"
    case ge = "GE"
    case gn = "GN"
    case gp = "GP"
    case gr = "GR"
    case gt = "GT"
    case hk = "HK"
    case hn = "HN"
    case hr = "HR"
    case ht = "HT"
    case hu = "HU"
    case id = "ID"
    case ie = "IE"
    case il = "IL"
    case im = "IM"
    case ind = "IN"
    case iq = "IQ"
    case ir = "IR"
    case isl = "IS"
    case it = "IT"
    case jm = "JM"
    case jo = "JO"
    case jp = "JP"
    case ke = "KE"
    case kg = "KG"
    case kh = "KH"
    case kp = "KP"
    case kr = "KR"
    case kz = "KZ"
    case lb = "LB"
    case lk = "LK"
    case lr = "LR"
    case lt = "LT"
    case lu = "LU"
    case lv = "LV"
    case ly = "LY"
    case ma = "MA"
    case mc = "MC"
    case md = "MD"
    case me = "ME"
    case mf = "MF"
    case mg = "MG"
    case mh = "MH"
    case mk = "MK"
    case ml = "ML"
    case mn = "MN"
    case mt = "MT"
    case mv = "MV"
    case mx = "MX"
    case my = "MY"
    case na = "NA"
    case ne = "NE"
    case ng = "NG"
    case nl = "NL"
    case no = "NO"
    case np = "NP"
    case nz = "NZ"
    case pa = "PA"
    case pe = "PE"
    case pf = "PF"
    case pg = "PG"
    case ph = "PH"
    case pk = "PK"
    case pl = "PL"
    case pr = "PR"
    case ps = "PS"
    case pt = "PT"
    case py = "PY"
    case ro = "RO"
    case rs = "RS"
    case ru = "RU"
    case rw = "RW"
    case sa = "SA"
    case sb = "SB"
    case sc = "SC"
    case sd = "SD"
    case se = "SE"
    case sg = "SG"
    case si = "SI"
    case sk = "SK"
    case sm = "SM"
    case so = "SO"
    case sr = "SR"
    case ss = "SS"
    case sv = "SV"
    case sx = "SX"
    case th = "TH"
    case tj = "TJ"
    case tm = "TM"
    case tn = "TN"
    case to = "TO"
    case tr = "TR"
    case tw = "TW"
    case tz = "TZ"
    case ua = "UA"
    case ug = "UG"
    case us = "US"
    case uy = "UY"
    case uz = "UZ"
    case va = "VA"
    case ve = "VE"
    case vn = "VN"
    case ws = "WS"
    case ye = "YE"
    case za = "ZA"
    case zm = "ZM"
    case zw = "ZW"
}
