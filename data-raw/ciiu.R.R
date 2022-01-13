
#base <- janitor::clean_names(readxl::read_excel("CIIU4.CL 2012.xlsx",skip = 1))
ciiu <- janitor::clean_names(readxl::read_excel("data-raw/CIIU4.CL 2012.xlsx",skip = 1))
#ciuo <- janitor::clean_names(readxl::read_excel("data-raw/ciuo.xls"))
ciuo <- janitor::clean_names(readxl::read_excel("data-raw/Clasificador Chileno de Ocupaciones CIUO 08.CL(excel)NO MODIFICAR.xls",skip=1))

usethis::use_data(ciuo, ciiu, internal = TRUE, overwrite = TRUE)

usethis::use_data(ciuo, ciiu)
