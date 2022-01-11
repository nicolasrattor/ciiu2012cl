
#base <- janitor::clean_names(readxl::read_excel("CIIU4.CL 2012.xlsx",skip = 1))
ciiu <- janitor::clean_names(readxl::read_excel("data-raw/CIIU4.CL 2012.xlsx",skip = 1))
ciuo <- janitor::clean_names(readxl::read_excel("data-raw/ciuo.xls"))

usethis::use_data(ciuo, ciiu, internal = TRUE, overwrite = TRUE)
