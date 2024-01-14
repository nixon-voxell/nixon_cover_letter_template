// const color
#let color_darknight = rgb("#131A28")
#let color_darkgray = rgb("333333")

// layout utility
#let justify_align(left_body, right_body) = {
  block[
    #left_body
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let justify_align_3(left_body, mid_body, right_body) = {
  block[
    #box(width: 1fr)[
      #align(left)[
        #left_body
      ]
    ]
    #box(width: 1fr)[
      #align(center)[
        #mid_body
      ]
    ]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let generate_contact(icon, contact, url: "") = {
  block[
    #icon
    #if url != "" {
      link(url)[#contact]
    } else {
      contact
    }
  ]
}

#let letter(author: (), date: "", recipient: "Sir/Madam", body) = {
  set document(
    author: author.firstname + " " + author.lastname, 
    title: "resume",
  )
  
  set text(
    font: ("Source Sans Pro"),
    lang: "en",
    size: 11pt,
    fill: color_darknight,
    fallback: false
  )

  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 10mm),
    footer: [
      #set text(fill: gray, size: 8pt)
      #justify_align_3[
        #smallcaps[#date]
      ][
        #smallcaps[
          #author.firstname
          #author.lastname
          #sym.dot.c
          #"Cover Letter"
        ]
      ][
        #counter(page).display()
      ]
    ],
    footer-descent: 0pt,
  )
  
  // set paragraph spacing
  show par: set block(above: 0.75em, below: 0.75em)
  set par(justify: true)

  set heading(
    numbering: none,
    outlined: false,
  )
  
  let name = {
    align(left)[
      #pad(bottom: 5pt)[
        #block[
          #set text(size: 20pt, style: "normal", font: ("Roboto"))
          #text(weight: "thin")[#author.firstname]
          #linebreak()
          #text(weight: "bold")[#author.lastname]
        ]
      ]
    ]
  }

  let positions = {
    set text(
      size: 9pt,
      weight: "regular"
    )
    align(left)[
      #smallcaps[
        #author.positions.join(
          text[#"  "#sym.dot.c#"  "]
        )
      ]
    ]
  }

  let contacts0 = {
    set box(height: 11pt)

    let email_icon = box(image("assets/icons/mail.svg"))
    let phone_icon = box(image("assets/icons/phone.svg"))
    let location_icon = box(image("assets/icons/location.svg"))
    let linkedin_icon = box(image("assets/icons/linkedin.svg"))

    align(left)[
      #generate_contact(email_icon, author.email, url: "mailto:" + author.email)
      #generate_contact(phone_icon, author.phone)
      #generate_contact(location_icon, author.loc)
      #generate_contact(linkedin_icon, author.linkedin, url: "https://linkedin.com/in/" + author.linkedin)
    ]
  }

  let contacts1 = {
    set box(height: 11pt)

    let url_icon = box(image("assets/icons/url.svg"))
    let github_icon = box(image("assets/icons/github.svg"))
    let youtube_icon = box(image("assets/icons/youtube.svg"))
    let itchio_icon = box(image("assets/icons/itchio.svg"))

    align(left)[
      #generate_contact(url_icon, author.url_name, url: author.url)
      #generate_contact(github_icon, author.github, url: "https://github.com/" + author.github)
      #generate_contact(youtube_icon, author.youtube, url: "https://youtube.com/" + author.youtube)
      #generate_contact(itchio_icon, author.itchio, url: "https://itch.io/profile/" + author.itchio)
    ]
  }

  align(left)[
    #box[
      #box(radius: 6pt, clip: true)[#image("assets/images/me.jpg", height: 80pt)]
      #h(8pt)
      #box[
        #name
        #positions
      ]
    ]
    #h(1fr)
    #box[#contacts0]
    #h(1fr)
    #box[#contacts1]
  ]

  set text(
    size: 12pt,
    hyphenate: false,
  )

  set par(
    first-line-indent: 18pt,
    leading: 10pt,
    justify: true,
  )

  [
    #linebreak()
    #line(length: 100%)

    #linebreak()
    Dear #recipient \
    #linebreak()

    #body

    #linebreak() \
    Best Regards, \
    _ #author.firstname _
  ]
}
