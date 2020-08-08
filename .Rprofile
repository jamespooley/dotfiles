options(
  repos = c(CRAN = "https://cloud.r-project.org")
  warnPartialMatchArgs = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchAttr = TRUE,
  menu.graphics = FALSE
)

options(
  usethis.full_name = "James Pooley",
  usethis.description = list(
    `Authors@R` = 'person("James", "Pooley", role = c("aut", "cre"))',
    License = "MIT + full LICENSE",
    Version = "0.0.0.9000"
  ),
  usethis.protocol = "ssh"
)

if (interactive()) {
  suppressMessages(require(devtools))
}


# https://medium.com/@davidhughjones/r-functions-without-brackets-2052bb7ee396
print.command <- function (cmd) {
  default.args <- attr(cmd, "default.args")
  if (length(default.args) == 0L) default.args <- list()
  res <- do.call(cmd, default.args, envir = parent.frame(2))
  if (attr(cmd, "print_result")) print(res)
  invisible(NULL)
}

make_command <- function(x, ..., print = TRUE) {
  class(x) <- c("command", class(x))
  attr(x, "default.args") <- list(...)
  attr(x, "print_result") <- print
  x
}

if (interactive()) {
  exit <- make_command(q, save = "no", print = FALSE)
  pwd <- make_command(getwd)
}
