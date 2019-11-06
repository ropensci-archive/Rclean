### Render and migrate README.md
rmarkdown::render("inst/README.rmd")
file.rename("inst/README.md", "README.md")

