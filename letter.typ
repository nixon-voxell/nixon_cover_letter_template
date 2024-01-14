#import "template.typ": *

#show: letter.with(
  author: (
    firstname: "(Nixon) Yi Heng", 
    lastname: "Cheng",
    email: "voxell.technologies@gmail.com", 
    phone: "(+60) 173389100",
    loc: "Malaysia",
    linkedin: "nixonyh",
    github: "nixon-voxell",
    url_name: "linktr.ee/voxell",
    url: "https://linktr.ee/voxell",
    youtube: "@voxelltech",
    itchio: "nixon-voxell",
    positions: (
      "Computer Graphics Engineer",
      "\nTechnical Artist",
    ),
  ),
  date: datetime.today().display("[day] [month repr:long] [year]")
)

#lorem(80)

#lorem(100)

#lorem(90)

#lorem(40)
