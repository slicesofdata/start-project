###############################################################
## Function installs and loads libraries if not installed
###############################################################
install_if_not_installed <- function(
    package_names,
    load_after_install = FALSE
) {
  # Install missing packages
  for (package_name in package_names) {
    if (!package_name %in% rownames(installed.packages())) {
      tryCatch({
        install.packages(package_name)
        package_version <- as.character(packageVersion(package_name))
        message(paste("Package", package_name, "version", package_version, "has been installed."))
      }, error = function(e) {
        message(paste("Failed to install package", package_name, ":", e$message))
      })
    } else {
      package_version <- as.character(packageVersion(package_name))
      message(paste("Package", package_name, "is already installed with version", package_version, "."))
    }
  }

  # Load if requested
  if (load_after_install) {
    for (package_name in package_names) {
      tryCatch({
        library(package_name, character.only = TRUE)
        message(paste("Package", package_name, "has been loaded."))
      }, error = function(e) {
        message(paste("Failed to load package", package_name, ":", e$message))
      })
    }
  }
}
###############################################################


# ensure {here} is installed
install_if_not_installed("here")


# for RStudio project newbies, verify the project directory is correct
message(here::here())


# get the zip file
zip_file <- list.files(pattern = ".zip", full.names = TRUE)


# unzip the contents to the top project dir
if (file.exists(zip_file)) {
  unzip(zipfile = zip_file,
        exdir = here::here()
  )
}

