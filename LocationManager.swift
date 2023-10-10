//
//  locations.swift
//  Tides
//
//  Created by Paul Cristelo on 9/21/23.
//

import Foundation

class LocationManager {
	static let shared = LocationManager()
	let all = [
		"Dauphin Island, AL": "8735180",
		"Dog River Bridge, AL": "8735391",
		"East Fowl River Bridge, AL": "8735523",
		"Coast Guard Sector Mobile, AL": "8736897",
		"Mobile State Docks, AL": "8737048",
		"Chickasaw Creek, AL": "8737138",
		"West Fowl River Bridge, AL": "8738043",
		"Bayou La Batre Bridge, AL": "8739803",
		"Ketchikan, AK": "9450460",
		"Port Alexander, AK": "9451054",
		"Sitka, AK": "9451600",
		"Juneau, AK": "9452210",
		"Skagway, Taiya Inlet, AK": "9452400",
		"Elfin Cove, AK": "9452634",
		"Yakutat, Yakutat Bay, AK": "9453220",
		"Cordova, AK": "9454050",
		"Valdez, AK": "9454240",
		"Seward, AK": "9455090",
		"Seldovia, AK": "9455500",
		"Nikiski, AK": "9455760",
		"Kodiak Island, AK": "9457292",
		"Alitak, AK": "9457804",
		"Sand Point, AK": "9459450",
		"King Cove, AK": "9459881",
		"Adak Island, AK": "9461380",
		"Atka, AK": "9461710",
		"Nikolski, AK": "9462450",
		"Unalaska, AK": "9462620",
		"Unalakleet, AK": "9468333",
		"Nome, Norton Sound, AK": "9468756",
		"Red Dog Dock, AK": "9491094",
		"Prudhoe Bay, AK": "9497645",
		"San Diego, CA": "9410170",
		"La Jolla, CA": "9410230",
		"Santa Monica, CA": "9410840",
		"Santa Barbara, CA": "9411340",
		"Port San Luis, CA": "9412110",
		"Monterey, CA": "9413450",
		"San Francisco, CA": "9414290",
		"Redwood City, CA": "9414523",
		"Alameda, CA": "9414750",
		"Richmond, CA": "9414863",
		"Point Reyes, CA": "9415020",
		"Martinez-Amorco Pier, CA": "9415102",
		"Port Chicago, CA": "9415144",
		"Arena Cove, CA": "9416841",
		"North Spit, CA": "9418767",
		"Crescent City, CA": "9419750",
		"Christiansted Harbor, St Croix, VI": "9751364",
		"Lameshur Bay, St John, VI": "9751381",
		"Lime Tree Bay, VI": "9751401",
		"Charlotte Amalie, VI": "9751639",
		"Culebra, PR": "9752235",
		"Isabel Segunda, Vieques Island, PR": "9752621",
		"Esperanza, Vieques Island, PR": "9752695",
		"Fajardo, PR": "9753216",
		"Yabucoa Harbor, PR": "9754229",
		"San Juan, La Puntilla, San Juan Bay, PR": "9755371",
		"Salinas, Bahia de Jobos, PR": "9755968",
		"Arecibo, PR": "9757811",
		"Guayanilla, Bahia de Guayanilla, PR": "9758066",
		"Magueyes Island, PR": "9759110",
		"Mayaguez, PR": "9759394",
		"Mona Island, PR": "9759938",
		"New Haven, CT": "8465705",
		"Bridgeport, CT": "8467150",
		"Delaware City, DE": "8551762",
		"Reedy Point, DE": "8551910",
		"Brandywine Shoal Light, DE": "8555889",
		"Lewes, DE": "8557380",
		"Washington, DC": "8594900",
		"Fernandina Beach, FL": "8720030",
		"Mayport (Bar Pilots Dock), FL": "8720218",
		"Dames Point, FL": "8720219",
		"Southbank Riverwalk, St Johns River, FL": "8720226",
		"I-295 Buckman Bridge, FL": "8720357",
		"Trident Pier, Port Canaveral, FL": "8721604",
		"Lake Worth Pier, Atlantic Ocean, FL": "8722670",
		"South Port Everglades, FL": "8722956",
		"Virginia Key, Biscayne Bay, FL": "8723214",
		"Vaca Key, Florida Bay, FL": "8723970",
		"Key West, FL": "8724580",
		"Naples, Gulf of Mexico, FL": "8725110",
		"Fort Myers, FL": "8725520",
		"Port Manatee, FL": "8726384",
		"St. Petersburg, Tampa Bay, FL": "8726520",
		"Old Port Tampa, FL": "8726607",
		"East Bay, FL": "8726674",
		"Clearwater Beach, FL": "8726724",
		"Cedar Key, FL": "8727520",
		"Apalachicola, FL": "8728690",
		"Panama City, FL": "8729108",
		"Panama City Beach, FL": "8729210",
		"Pensacola, FL": "8729840",
		"Fort Pulaski, GA": "8670870",
		"Kings Bay MSF Pier, GA": "8679598",
		"Ogdensburg, NY": "8311030",
		"Nawiliwili, HI": "1611400",
		"Honolulu, HI": "1612340",
		"Pearl Harbor, HI": "1612401",
		"Mokuoloe, HI": "1612480",
		"Kahului, Kahului Harbor, HI": "1615680",
		"Kawaihae, HI": "1617433",
		"Hilo, Hilo Bay, Kuhio Bay, HI": "1617760",
		"Pilottown, LA": "8760721",
		"Pilots Station East, S.W. Pass, LA": "8760922",
		"Shell Beach, LA": "8761305",
		"Grand Isle, LA": "8761724",
		"New Canal Station, LA": "8761927",
		"Carrollton, LA": "8761955",
		"Port Fourchon, Belle Pass, LA": "8762075",
		"West Bank 1, Bayou Gauche, LA": "8762482",
		"LAWMA, Amerada Pass, LA": "8764227",
		"Eugene Island, North of, Atchafalaya Bay, LA": "8764314",
		"Lake Charles, LA": "8767816",
		"Bulk Terminal, LA": "8767961",
		"Calcasieu Pass, LA": "8768094",
		"Eastport, ME": "8410140",
		"Cutler Farris Wharf, ME": "8411060",
		"Bar Harbor, ME": "8413320",
		"Portland, ME": "8418150",
		"Seavey Island, ME": "8419870",
		"Ocean City Inlet, MD": "8570283",
		"Bishops Head, MD": "8571421",
		"Cambridge, MD": "8571892",
		"Tolchester Beach, MD": "8573364",
		"Chesapeake City, MD": "8573927",
		"Baltimore, MD": "8574680",
		"Annapolis, MD": "8575512",
		"Solomons Island, MD": "8577330",
		"Boston, MA": "8443970",
		"Fall River, MA": "8447386",
		"New Bedford Harbor, MA": "8447636",
		"Woods Hole, MA": "8447930",
		"Nantucket Island, MA": "8449130",
		"Pascagoula NOAA Lab, MS": "8741533",
		"Bay Waveland Yacht Club, MS": "8747437",
		"Sandy Hook, NJ": "8531680",
		"Atlantic City, NJ": "8534720",
		"Cape May, NJ": "8536110",
		"Burlington, Delaware River, NJ": "8539094",
		"Montauk, NY": "8510560",
		"Kings Point, NY": "8516945",
		"The Battery, NY": "8518750",
		"Bergen Point West Reach, NY": "8519483",
		"Duck, NC": "8651370",
		"Oregon Inlet Marina, NC": "8652587",
		"USCG Station Hatteras, NC": "8654467",
		"Beaufort, Duke Marine Lab, NC": "8656483",
		"Wilmington, NC": "8658120",
		"Wrightsville Beach, NC": "8658163",
		"Port Orford, OR": "9431647",
		"Charleston, OR": "9432780",
		"South Beach, OR": "9435380",
		"Garibaldi, OR": "9437540",
		"Astoria, OR": "9439040",
		"Wauna, OR": "9439099",
		"St Helens, OR": "9439201",
		"Marcus Hook, PA": "8540433",
		"Philadelphia, PA": "8545240",
		"Bridesburg, PA": "8546252",
		"Newbold, PA": "8548989",
		"Newport, RI": "8452660",
		"Providence, RI": "8454000",
		"Quonset Point, RI": "8454049",
		"Springmaid Pier, SC": "8661070",
		"Charleston, SC": "8665530",
		"Port Arthur, TX": "8770475",
		"Rainbow Bridge, TX": "8770520",
		"Morgans Point, Barbours Cut, TX": "8770613",
		"Manchester, TX": "8770777",
		"High Island, TX": "8770808",
		"Texas Point, Sabine Pass, TX": "8770822",
		"Rollover Pass, TX": "8770971",
		"Eagle Point, Galveston Bay, TX": "8771013",
		"Galveston Bay Entrance, North Jetty, TX": "8771341",
		"Sabine Offshore Light, TX": "8771367",
		"Galveston Pier 21, TX": "8771450",
		"San Luis Pass, TX": "8771972",
		"Freeport Harbor, TX": "8772471",
		"Seadrift, TX": "8773037",
		"Matagorda City, TX": "8773146",
		"Port Lavaca, TX": "8773259",
		"Port O'Connor, TX": "8773701",
		"Matagorda Bay Entrance Channel, TX": "8773767",
		"Aransas Wildlife Refuge, TX": "8774230",
		"Rockport, TX": "8774770",
		"La Quinta Channel North, TX": "8775132",
		"Viola Turning Basin, TX": "8775222",
		"Port Aransas, TX": "8775237",
		"Aransas, Aransas Pass, TX": "8775241",
		"Nueces Bay, TX": "8775244",
		"Enbridge, Ingleside, TX": "8775283",
		"USS Lexington, Corpus Christi Bay, TX": "8775296",
		"Packery Channel, TX": "8775792",
		"S. Bird Island, TX": "8776139",
		"Baffin Bay, TX": "8776604",
		"Rincon Del San Jose, TX": "8777812",
		"Port Mansfield, TX": "8778490",
		"Realitos Peninsula, TX": "8779280",
		"South Padre Island CG Station, TX": "8779748",
		"SPI Brazos Santiago, TX": "8779749",
		"Port Isabel, TX": "8779770",
		"Wachapreague, VA": "8631044",
		"Kiptopeke, VA": "8632200",
		"Dahlgren, VA": "8635027",
		"Lewisetta, VA": "8635750",
		"Yorktown USCG Training Center, VA": "8637689",
		"Sewells Point, VA": "8638610",
		"CBBT, Chesapeake Channel, VA": "8638901",
		"Money Point, VA": "8639348",
		"Vancouver, WA": "9440083",
		"Longview, WA": "9440422",
		"Skamokawa, WA": "9440569",
		"Cape Disappointment, WA": "9440581",
		"Toke Point, WA": "9440910",
		"Westport, WA": "9441102",
		"La Push, Quillayute River, WA": "9442396",
		"Port Townsend, WA": "9444900",
		"Bremerton, WA": "9445958",
		"Tacoma, WA": "9446484",
		"Seattle, WA": "9447130",
		"Cherry Point, WA": "9449424",
		"Friday Harbor, WA": "9449880"
	]
	
	var sortedLocations: [String] {
		let sortedKeys = all.keys.sorted { a, b in
			let stateA = a.components(separatedBy: ", ").last ?? ""
			let stateB = b.components(separatedBy: ", ").last ?? ""
			if stateA == stateB {
				return a < b // If states are equal, sort by the full location name
			}
			return stateA < stateB
		}
		return sortedKeys
	}
	
	func sortedTimes(dict: [String: String]) -> [String] {
		let sortedKeys = dict.keys.sorted { a, b in
			let timeA = a.components(separatedBy: " ").last ?? ""
			let timeB = b.components(separatedBy: " ").last ?? ""
			if timeA == timeB {
				return a < b
			}
			return timeA < timeB
		}
		return sortedKeys
	}
	
	func fetchWaterLevel(location: Location) {
		let urlString = "https://api.tidesandcurrents.noaa.gov/api/prod/datagetter?date=latest&station=\(location.id)&product=one_minute_water_level&datum=MSL&time_zone=lst_ldt&units=english&format=json"

		guard let url = URL(string: urlString) else {
			print("Invalid URL")
			return
			
		}

		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Network error: \(error)")
				return
			}

			if let data = data {
				do {
					let decoder = JSONDecoder()
					let waterLevelResponse = try decoder.decode(WaterLevelResponse.self, from: data)
					if let firstData = waterLevelResponse.data.first {
						DispatchQueue.main.async {
							if location.comparedWaterLevel != location.waterLevel {
								location.comparedWaterLevel = location.waterLevel
							}
							location.time = firstData.t
							location.waterLevel = firstData.v
							location.newWaterLevels.append(firstData)
						}
					}
				} catch {
					print("Error decoding JSON: \(error)")
				}
			}
		}
		task.resume()
	}
	
	func fetchOldWaterLevel(location: Location) {
		let date = Date()
		print(date)
		let urlString = "https://api.tidesandcurrents.noaa.gov/api/prod/datagetter?&end_date=20231005&range=24&station=\(location.id)&product=one_minute_water_level&datum=MSL&time_zone=lst_ldt&units=english&format=json"

		guard let url = URL(string: urlString) else {
			print("Invalid URL")
			return
			
		}

		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Network error: \(error)")
				return
			}

			if let data = data {
				do {
					let decoder = JSONDecoder()
					let waterLevelResponse = try decoder.decode(WaterLevelResponse.self, from: data)
					DispatchQueue.main.async {
						for waterLevelData in waterLevelResponse.data {
							location.oldWaterLevels.append(waterLevelData)
						}
					}
				} catch {
					print("Error decoding JSON: \(error)")
				}
			}
		}
		task.resume()
	}
}

