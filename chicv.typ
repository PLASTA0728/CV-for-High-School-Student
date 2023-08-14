#import "fontawesome.typ": *

#let chiline() = {
  v(-3pt);
  line(length: 100%, stroke: gray);
  v(-10pt)
}

#let iconlink(
  uri, text: "", icon: link-icon) = {
  link(uri)[#fa[#icon] #text]
}

// cventry, position line and multicventry 

#let cventry(
  tl: lorem(2),
  tr: "",
  bl: "",
  br: "",
  content
) = {
  block(
    inset: (left: 0pt),
    strong(tl) + h(1fr) + tr +
    linebreak() +
    if bl != "" or br != "" {
      bl + h(1fr) + br + linebreak()
    } +
    content
  )
}

#let positionline(
  tl: lorem(2),
  tr: "2333/23 - 2333/23"
) = {
  strong(tl) + h(1fr) + tr + linebreak()
}

#let multicventry(
  experiences,
  content
) = {
  block(
    inset: (left: 0pt),
    experiences + 
    if content != "" {
      content
    }
  )
}

// honor, honorline and multihonor 

#let honor(
  tl: lorem(2),
  tc: "Institution",
  tr: "2333/23 - 2333/23",
  extra: "",
  content
) = {
  block(
    inset: (left: 9pt),
    tl + h(1fr) + tc + h(1fr)+ tr +
    linebreak()  +
    if extra != "" {
      extra + linebreak()
    }+
    if content != "" {
    h(9pt)+(text(9pt,blue,content))
    }
  )
}

#let honorline(
  tl: lorem(2),
  tc: "",
  tr: ""
) = {
  tl +  h(1fr) + tc + h(1fr) + tr +linebreak()  
}


#let multihonor(
  honors,
  explanation
) = {
  block(
    inset: (left: 9pt),
    honors + 
    if explanation != ""{
      h(9pt)+(text(9pt,blue,explanation))
    }
  )
}

// grade function for listed gpa

#let grade(
  tl: lorem(2),
  tc: "",
  tr: "",
  content
) = {
  block(
    inset: (left: 0pt),
    strong(tl) + h(1fr) + text(style: "italic",box[GPA: #tc]) + h(1fr)+ tr +
    if content != "" {
    h(9pt)+(text(9pt,content))
    }
  )
}




#let chicv(body) = {
  set par(justify: true)

  show heading.where(
    level: 1
  ): set text(
    size: 22pt,
    font: (
      "Avenir Next LT Pro", // original chi-cv font
      "Manrope", // a font available in the typst environment and looks similar to Avenir
    ),
    weight: "light",
  )

  show heading.where(
    level: 2
  ): it => text(
    size: 12pt,
    font: (
      "Avenir Next LT Pro",
      "Manrope",
    ),
    weight: "light",
    block(
      chiline() + it,
    )
  )
  set list(indent: 0pt)

  show link: it => underline(offset: 2pt, it)
  set page(
   margin: (x: 0.9cm, y: 1.3cm),
  )
  set par(justify: true)

  body
}
