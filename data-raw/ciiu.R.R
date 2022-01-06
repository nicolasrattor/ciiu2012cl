
base <- janitor::clean_names(readxl::read_excel("CIIU4.CL 2012.xlsx",skip = 1))

usethis::use_data(base, internal = TRUE, overwrite = TRUE)
