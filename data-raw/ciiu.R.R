
ciiu <- janitor::clean_names(readxl::read_excel("data-raw/ciiu4cl2012.xlsx",skip = 1))
#ciuo <- janitor::clean_names(readxl::read_excel("data-raw/data-raw/ciuo.xls"))
ciuo <- janitor::clean_names(readxl::read_excel("data-raw/ciuo08cl.xls",skip=1))

usethis::use_data(ciuo, ciiu, internal = TRUE, overwrite = TRUE)

usethis::use_data(ciuo, ciiu)
