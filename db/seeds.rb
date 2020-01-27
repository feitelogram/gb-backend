# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Provider.destroy_all
Saved.destroy_all

nic = User.create(username: "feitelogram", password: "nerd")
cmps = Provider.create(name: "CMPS", address: "16 W. 10th St NY, NY 10012", phone: "212-260-7050", website: "https://www.cmps.edu", email: "cmps@cmps.edu", category: "therapy")
saved = Saved.create(user: nic, provider: cmps)

therapy_results = `curl 'https://8rn20t1ndj-dsn.algolia.net/1/indexes/*/queries?x-algolia-agent=Algolia%20for%20JavaScript%20(3.33.0)%3B%20Browser%3B%20JS%20Helper%20(2.28.0)&x-algolia-application-id=8RN20T1NDJ&x-algolia-api-key=c9c14a2d9e24d14d85d2ae0a2ee235df' -H 'Connection: keep-alive' -H 'accept: application/json' -H 'Origin: https://nycwell.cityofnewyork.us' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36' -H 'content-type: application/x-www-form-urlencoded' -H 'Sec-Fetch-Site: cross-site' -H 'Sec-Fetch-Mode: cors' -H 'Referer: https://nycwell.cityofnewyork.us/en/find-services/?q=&f[0]=specialPopulations&f[1]=insurancesAccepted&f[2]=ageGroup&f[3]=county&hPP=10&idx=nycwell_prod&p=0&fR[county][0]=Manhattan&fR[insurancesAccepted][0]=Sliding%20Scale%20Fee%20(If%20Eligible)' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --data '{"requests":[{"indexName":"nycwell_prod","params":"query=&hitsPerPage=50&page=0&facets=%5B%22specialPopulations%22%2C%22insurancesAccepted%22%2C%22ageGroup%22%2C%22county%22%5D&tagFilters=&facetFilters=%5B%22county%3AManhattan%22%2C%22insurancesAccepted%3ASliding%20Scale%20Fee%20(If%20Eligible)%22%5D"}]}' --compressed`
therapy_parsed = JSON.parse(therapy_results)
therapy_array = therapy_parsed["results"][0]["hits"]

therapy_array.each do |data|
    Provider.create(
        name: data["programName"],
        address: data["formatted_address"],
        phone: data["phone"][0],
        website: data["website"],
        email: data["email"],
        category: "Therapy"
    )
end

alcohol_results = `curl 'https://www.nyintergroup.org/wp-admin/admin-ajax.php' -H 'Connection: keep-alive' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Origin: https://www.nyintergroup.org' -H 'X-Requested-With: XMLHttpRequest' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-Mode: cors' -H 'Referer: https://www.nyintergroup.org/meetings/?tsml-day=any&tsml-type=BE' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' -H 'Cookie: wpfront-notification-bar-landingpage=1; mailchimp_landing_site=https%3A%2F%2Fwww.nyintergroup.org%2Fmeetings%2F%3Ftsml-region%3Dmanhattan; PHPSESSID=571a241ab127ca34013948ffd8e9dc0f; tk_ai=woo%3AsT1lqWa244kFM9eaLXoG377n; wpfront-notification-bar-landingpage=1; hustle_module_show_count-slidein-1=1' --data 'action=meetings&mode=search&type=BE&distance=2&view=list&distance_units=mi&nonce=44c8ee9c76' --compressed`
alcohol_parsed = JSON.parse(alcohol_results)
alcohol_parsed[0..50].each do |data|
    Provider.create(
        name: data["value"],
        address: data["formatted_address"],
        phone: "(212) 647-1680",
        website: data["location_url"],
        email: "info@nyintergroup.org",
        category: "Substances"
    )
end

Provider.create(
        name: "City Lights Sunday",
        address: "336 W. 37th Street, NY, NY",
        phone: "646-703-0048",
        website: "http://slaany.org",
        email: "info@slaany.org",
        category: "Intimacy"
    )

    Provider.create(
        name: "Living in Recovery",
        address: "Blessed Sacrament Church 152 W. 71st St",
        phone: "646-703-0048",
        website: "http://slaany.org",
        email: "info@slaany.org",
        category: "Intimacy"
    )

    Provider.create(
        name: "Steps On Christopher Street an LGBTQ Meeting of SLAA",
        address: "St. John's Lutheran Church
        83 Christopher Street",
        phone: "646-703-0048",
        website: "http://slaany.org",
        email: "info@slaany.org",
        category: "Intimacy"
    )

    Provider.create(
        name: "Fantasy Addition Recovery",
        address: "St. Francis Education Center
        139 W. 31 St",
        phone: "646-703-0048",
        website: "http://slaany.org",
        email: "info@slaany.org",
        category: "Intimacy"
    )

    Provider.create(
        name: "SLAA Beginners Meeting",
        address: "St. Francis Education Center
        139 W. 31 St",
        phone: "646-703-0048",
        website: "http://slaany.org",
        email: "info@slaany.org",
        category: "Intimacy"
    )

    Provider.create(
        name: "Abundance",
        address: "415 East 72nd Street NY, NY",
        phone: "781-453-2743",
        website: "http://danyc.org/",
        email: "mrjshulman@aol.com",
        category: "Money"
    )

    Provider.create(
        name: "Business Debtors Anonymous",
        address: "482 West 43rd St., New York, NY 10036",
        phone: "781-453-2743",
        website: "http://danyc.org/",
        email: "help@danyc.info",
        category: "Money"
    )

    Provider.create(
        name: "VAULT: Visions, Actions, Underearning, Learning Tools",
        address: "410 W 40th Street., New York, NY",
        phone: "781-453-2743",
        website: "http://danyc.org/",
        email: "help@danyc.info",
        category: "Money"
    )

    Provider.create(
        name: "Debtors Anonymous Sought Through Prayer & Meditation",
        address: "208 West 13th St., New York, NY",
        phone: "781-453-2743",
        website: "http://danyc.org/",
        email: "help@danyc.info",
        category: "Money"
    )

    Provider.create(
        name: "Recovering from Underearning, Fear of Success, & Vision Issues",
        address: "273 Bowery., New York, NY",
        phone: "781-453-2743",
        website: "http://danyc.org/",
        email: "help@danyc.info",
        category: "Money"
    )
    

    




