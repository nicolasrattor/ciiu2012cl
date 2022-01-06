
#' Funciones para lidiar con meses
#'
#' La función retorna todos los elementos contenidos en la desagregación
#' consultada.
#'
#'
#'
#' @param let Path to the input file
#' @return A matrix of the infile
#' @export

ene3_to_n_meses <- function(x,y){
  ene <- ene %>% mutate(mes=tolower(substr(mes,1,3)))
  ene <- arreglarmes(ene,ene$mes)
  x <- dplyr::mutate(x,mes=case_when(y == "ene" ~ 2,
                                  y == "feb" ~ 3,
                                  y == "mar" ~ 4,
                                  y == "abr" ~ 5,
                                  y == "may" ~ 6,
                                  y == "jun" ~ 7,
                                  y == "jul" ~ 8,
                                  y == "ago" ~ 9,
                                  y == "sep" ~ 10,
                                  y == "oct" ~ 11,
                                  y == "nov" ~ 12,
                                  y == "dic" ~ 1))
}

espanol_to_n_meses <- function(x,y){
  x <- dplyr::mutate(x,mes=case_when(y == "ene" ~ 1,
                                  y == "feb" ~ 2,
                                  y == "mar" ~ 3,
                                  y == "abr" ~ 4,
                                  y == "may" ~ 5,
                                  y == "jun" ~ 6,
                                  y == "jul" ~ 7,
                                  y == "ago" ~ 8,
                                  y == "sep" ~ 9,
                                  y == "oct" ~ 10,
                                  y == "nov" ~ 11,
                                  y == "dic" ~ 12))
}
