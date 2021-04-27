/*
 
 567. Permutation in String
 
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

 Example 1:

 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
  
 Constraints:

 The input strings only contain lower case letters.
 The length of both given strings is in range [1, 10,000].
 
 */

// Slow
/*
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s2.count < s1.count {
        return false
    }
    let s1s = s1.sorted()
    for i in s1.count ... s2.count {
        let s = s2.prefix(i).suffix(s1.count)
        let ss = s.sorted()
        if ss == s1s {
            return true
        }
    }
    return false
}
*/

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s2.count < s1.count {
        return false
    }
    var s1map: [Int] = Array(repeating: 0, count: 26)
    let aChar: Character = "a"
    for i in 0 ..< s1.count {
        let c = s1[s1.index(s1.startIndex, offsetBy: i)]
        s1map[Int(c.asciiValue! - aChar.asciiValue!)] += 1
    }
    for i in 0 ... s2.count -  s1.count {
        var smap: [Int] = Array(repeating: 0, count: 26)
        for j in 0 ..< s1.count {
            let c = s2[s2.index(s2.startIndex, offsetBy: i + j)]
            smap[Int(c.asciiValue! - aChar.asciiValue!)] += 1
        }
        if match(smap, s1map) {
            return true
        }
    }
    return false
}

func match(_ map1: [Int], _ map2: [Int]) -> Bool {
    for i in 0 ..< map1.count {
        if map1[i] != map2[i] {
            return false
        }
    }
    return true
}

//let s1 = "ab"
//let s2 = "eidbaooo"//"eidboaoo"//"a"////""


let s1 = "jqowgtqdokaxwlqdhfvyxnaflcxinzmwptndasfcllrucjvixufbcdrwcxbjmvwmjzjcqnugddugkaqbirmthedbfidisueqruimmvetezyzjvyqzucdlrlicqldmtsrluhphqrwejqbcgafhqxfxceibvshmvdjubdinoeqlitgnhvjvbqwcvdhncxognwoaeyojayyrzbokaxsihhkzbkvaczlmepzhlwnyzdzborlwbhicmdyieiwarxwpzgukknkplhmkciolicttdsbesbkysnpwhhqmpdctfqyawxxbrjmgbefhuajwedaingmrwfdptobbkfxgupczsahmxngmupbolysndbgswzlxldjynxrooiszcfyhixupcgudalteszwwkrhipqmxckzxydftkoxsmemggcedizgqihcjnbnjaduhucwoxarpachkqmnhafddyhaoqkeskodukkgnnejjskykgwfnoyspcjgvnbjmxdnpvxjbwqkokzchcvddbuzgtbackxevisusequrqwrsmeqbffcfzzzdqvreeydfygkmkzftzgbkjznqqdpzanpojqhrrghmnmmjsgxnozjnieuffbsvtxzizwhhtcrszyjwlmbxklakzhymzvpuuywpqksiuifkshzsdsnsgdbpmgvinihwykzzpoojukgltdcvncerrmxkrnqrmslchvlarghbnqgdtyfrwsuhhodymsrpxgqptjlvhmlcazvvybuljbpaqqqqdcufkqgcknrlrwzbdtqqykdwrqputjxortexovmtpmeyogxxcykxpbknbrjvwgfdrjmrwxutbwzcialjnbokhddaonxfoqaxarkzslcwqorlhdpsbryswboxftjjbmvlvstzfgmvvltbziyflrddkyxslifvcunyxrmbhadolsebrumwcjlkzfpncweynspxpftcbahdwjlmaxyvigxubjgoimyqtxqiajidfmajgpkqpcznuafehnkznydfxuvfucngrxksggapliibymejxzcmbdrfbzdjxyzblphmkhqluqtviuzixhgwqqueeckurttbsssykhsexmqqtfeicpjckvsgrmcwayjpshkltnqapjbbhhihlalzeuddrmodkeofemhzgqwiyoygpajbqpscuzpzsprkyobbtypegbqbnodpiuwptxgvmizxcgcocqymcranquqnwggwjbcskwjvvnpfmhaohrhuzmfgskufilqstxinwdockopciyuaaeoqdappvlfzklqlpjrkaeigtlfvjcfuxlazrxnqupcnlkyqwfkyhpvnirltoxrckanedkezyekbiolscaqltwxpoybxrspmamjmdmjfflxeokelpsavsdvhqqbwtopsfkijdzsygkoinqwhufwnbgauiprsitlapkllaipwbdbzettoxmfddynxhrujwcouxgtrjemrxmceaatfxomyqyqjpiwducxpuyailvgiuxrzoonydokcymdgqzbuanzdxufcftqremdcrbyspoylvcqvyoyxhsbvlpamysyqltiwnsicvatgmztrmicpsedldlhylellpmqvhymryfhkbkdytdqlonsuzyqsimlsfxbdffpcziviwxfiraaoepadarqpldxecydtcogbpnuugbendyvxgpybhqzwgussybomxzdmmrvysqimxxyjqrvjwjjivwywdqmsgkgdzhpaahpanxkzqbhtjqdgjcybnufpwutuafdzegslokejhfwrrdmlyitegckpzyipmyhsdpukrgbduoifxqikvlahjkicjhtofiufnjdanzhtomtxswwcljezreipjlpkzmpkisklxanpdzzetfzecdjinacsuilnejspdqihzlbshvqfnycfwgcgzbmmpiwrwtrpnmkiegdahhttlqvxqbnqpbqyxkaslgxvwsyjyuahenadpmfinwdzcudgkjfwkahjs"
let s2 = "deasvrgsdxhdbemwpenmbhjbnykuygxvmfkjagxnjoywjdgmjewtofmbpfehbfgauiihajsdbarllcmoqkqvebwvtitjqscqnantzpqtifwvmzlnkyuxoruhqlvvoqqdwzccprqmsrllrzfyvqgiyrbqlmskrqjdfdvygtsmijcqdhmpuqhrmsrwzsnnxpynjtechsxvlwhurtqbieshuragietmcokwxrlvehihspodjkkpweqekrjemnsimexuktmoqiowiyifqjsylmmejuhltwjfqfyyujuwdivyzctvrkefdzpwqrzpembtrcamzubewkanmgnmfjyatgnkxtmimnqsodgvnbkowvjebslcfdrqjkpjhfqojwtdfunhctckgipwgmtlzialllhcnarbbrtxgzddmryuohmjtsnpkkpvtipqjkucuqnqgdvvsquedghikbayosxjfwrvlnjpukbxhzruatdiwemwjnjpkwancvdniwiefcstdgyhycntmgroneylurnehnhjqjqomcgcwprwdoejlvaponqhyaultpxqvykydofkpurzqhygxmieyjotxhiqtvlnmffxurxhmrhvdkkgwaekojxocoofvznjynlzhbojbkljzhihfepmhuirqxsxjslbaoilykltzpqzjzvoqenjuayqmktpsoedxnwwibotpjgpmpfsnbipuammzlaogvekhzftqxrbmiwuhynpaznoqsxfiuacwogolvqvzbqlmunaemsvhlmtkavbzvhdignnhdziydpqaizjlytqjrhgtbdaxmgepysvtnampnldgpgtrbhtzhfbvclwustztaerkzggiekheckfquleawilaexocaggnxeygovsfzkjkeizfkfcffdrgzcftjlaluooqkgceoahlhwvfmwwkgqiqxstlzahtyzicnyboeqstdskkidqcseyrjfsucvyefbkikfjzesdpoxkhstiapcidwxaantpxzjxuipkzcrybgftemljmdaeisvfrnlrzlbbxukiggchmpriytsdqlzbjsgrfffwiwdupgjkudtemkncffcxxdeqepqcbmcfurwbjhsyvjxlzittwsodkgnfsklbzdclcsireusuzfraqmjrhbtyrnogsfllnjbxwicpsshhgiqgdnlvzybzdkgpngyylznhxaktgmiriqrfsigowybnrdfhwbknjpwqwrvcmvxpfqpburfglokymmwjshsjrdzlcxzmpwefyqwgjvvjlejhpcfvdfnlbyuvwdsoihailxypsoswpfauxdbaqukclmqikmimiryeptmygvkvmcjkkswthokvksoibotyrsprajrjucvukekiuyjnydiwaqpelrxadrhruhqoxhowbabtfwaxlvqbzpghijvbkxqqgmdksecjymvtrqqgycvmqjbdypphvfkhrfbnkxyyxkguxpdjvndwpihdtlvarfxveltnvmmdufihhqttmbpoyzwhieoblwjaoxbhmvmbklpuprlvqthmdskyixgcspiawdeoopxhzpsdtxsfjzrkdvnbtmbehjqowgtqdokaxwlqdhfvyxnaflcxinzmwptndasfclnrucjvixufbcdrwcxbjmvwmjzjcqnhgddugkaqqirmthedbfidisueqruimmvetezyzjvyqzucdlrlfaqldmtsrluhphqrwejqbcgafhqxfxceibvshmvdjubdinoeqlitgnhvjvbqwcvdhncxognwoaeyojayyrzmokpxsihhkzbkvaczlmepzhlwnyzdzborlwbhicmduieiwarxwpzgukknkplhmkcioficttdsbesbkysnpwhhqmpdctfqyawxxbrjmgbefhuajwedaingmrwfdptobbkfxgupczsahmxngmupbolysndbgswzlxldjynxrooiszcfyhixupcgudalteszwwkrhipqmxckzxydftkoxsmemggcxhizgqihcjnbnjaduhucwoxarpachkqmnhafddyhaoqkeskodukkgnnejjskykgwfnoyspcjgvnbjmxdnpvxjbwqkokzchcvddbuzgtbackxevisusequrqwrsmeqbffcfzzzdqvreeydfygkmkzftzgbkjznqqdpzanpojqhrrghmnmmjsgxnozjnieuffbsvtxzizwhhtcrszyjwlmbxklakzhymzvpuuywpqksauifkshzsdsnsgdbpmgvinihwykzzpoojukgltdcvncerrmxkrnqrmslchvlarghbnqgdtyfrwsuhhodymsrpxgqptjlvhmlcazvvybuljbpaqqqqdculkqgckdrlrwzbdtqqykdwrqputjxortexovmtpmeyogxxcykxpbknbrjvwgfdrjmrwxutbwzcijnjnbokhddaonxfoqaxarkzslcwqorlhdvsbryswboxftjjbmvlvstzfgmvvltbziyflrddkyxslifvcunyxrmbradolsebrumwcjlkzfpncweynspxpftcbahdwjlmaxyvigxubjgoimyqtxqiajidfmajgpkqpcznuafetnkznydfxuvfucngrxksggapliibymejxzcmbdrfbzdjxyzblphmkhqlubtviuzixhgwqqueeckurttbsssykhsexmqqtfeicpjckvsgrbcwayjpshkltnqapjbbhhinlalzeuddrmodkeofemhzgqweyoygpajbqpscuzpzsprkyobbtypegbqbnodpiuwptxgvmizxcgcocqymcranquqnwggwjbcskwjvvnpfmhaohhhuzmfgskufilqstxinwdockopciyuaaeoqdappvlfzklqlpjrkaeigdlfvjcfuxlazrxnqupcnlkyqwfkyhpvnirltoxrckanedkezyekbiolscaqltwxpoybxrspmamjmdmafflxeokelpsavsdvhqqbwtopsfkijdzsygkoihqwhyfwnbgauiprsitlapkllaipwbdbzettoxmfddynxhrujwcouxgtrjemrxmciaatfxomyqyqjpiwducepuyailvgiuxrzoonydokcymdgqzbuanzdxufcftqremdcrbyspoylvcqvyoyxhsbvlpamysyqltiwnsicvatgmztrmicpsedldlhylellpmqvhymryfhkbkdytdqlonsuzyqsimlsfxbdffpcziviwxfiraaoepadarqpldxecydtcogbpnuugbendyvxgpybhqzwgussybomxzdmmrvysqimxxyjqrpjwjjivwywdqmsgkgdzhpaahpalxkzqbhtjqdgjcybnufpwutuafdzegslokejhfwrrdmlyitegckpzyipmyhsdpukrgbduoiixqikvlahjkicjutofiufnjdanzhtomtxswwcljezreipjlpkzmpkisklxanidzzetfzecljinacsuilnejspdqihzlbshvqfnycfwgcgzbmmpiwrwtrpnmkiegdchhttlqvxqbnqpbqyxkaslgxvwsyjyuahenadpmfinwdzcudgkjfwkahjsyerluvhlmudkshnvhqygjxpfvblelciwbkiflnutrihyffamtmtnklexvvelsoyjypppvflbeoxorlfmhryxcvyeypxdtailsnfiuqapwhrovfrhkeqpzeysxhqyjpihbdnqpshyemgpxcnscfzgydmemuffryevsjxdcbynebxnhvfwpnhmmxzubjkmqkecmoqtugbxdwowcawjmqlmwjlwmaxftpdnprgxekkusmzuythqmqtacbyepvoickldankkssjyfpxqmabqorvtpgztuqyjgqjhmzmqnuyrfgjkrgoimnbhkzhoefscczbejgkjtztwwcsmalbezdtxihbyimigmotxuftbszrnquyvuxacdrwnzmstkxujwjcmmqmbennupqzvjgxgyrbttudkpprljznpjhadlavgzisehircbdnxmltfsmbffppszjtekdfeagpquf"

checkInclusion(s1, s2)
