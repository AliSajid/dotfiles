if (interactive()) {
  suppressMessages(require(devtools))
}

r <- getOption("repos")
r["CRAN"] <- "https://cloud.r-project.org/"

## Hard code the US repository for CRAN so it doesn't ask me every time.
options(
  usethis.full_name = "Ali Sajid Imami",
  usethis.description = list(
    `Authors@R` = 'person("Ali", "Imami", "Sajid", email = "Ali.Sajid.Imami@gmail.com", role = c("aut", "cre"),
    comment = c(ORCID = "0000-0003-3684-3539"))',
    License = "GPL-3",
    Version = "0.0.0.9000"
  ),
  usethis.protocol = "https",
  scipen = 999,
  vsc.rstudioapi = TRUE,
  prompt = "AwesomeR> ",
  repos = r,
  blogdown.hugo.version = "0.96.0",
  styler.save_after_styling = TRUE
)

rm(r)


# setup if using with vscode and R plugin
if (Sys.getenv("TERM_PROGRAM") == "vscode") {
  source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))

  if (file.exists(file.path("renv", "activate.R"))) {
    source("renv/activate.R")


    if (Sys.getenv("TERM_PROGRAM") == "vscode") {
      # obtain list of packages in renv library currently
      project <- renv:::renv_project_resolve(NULL)
      lib_packages <- names(unclass(renv:::renv_diagnostics_packages_library(project))$Packages)

      # detect whether key packages are already installed
      if (!"languageserver" %in% lib_packages) {
        message("installing languageserver package")
        renv::install("languageserver")
      }

      if (!"httpgd" %in% lib_packages) {
        message("installing httpgd package")
        renv::install("httpgd")
      }

      if (!"vscDebugger" %in% lib_packages) {
        message("installation vscDebugger package")
        renv::install("ManuelHentschel/vscDebugger@v0.4.7")
      }

      # use the new httpgd plotting device
      options(vsc.plot = FALSE)
      options(device = function(...) {
        httpgd:::hgd()
        .vsc.browser(httpgd::hgd_url(), viewer = "Beside")
      })
    }
  }
}
