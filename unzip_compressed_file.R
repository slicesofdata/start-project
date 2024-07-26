# get the zip file
zip_file <- list.files(pattern = ".zip", full.names = TRUE)


# unzip the contents
unzip(zipfile = zip_file, exdir = here::here())
