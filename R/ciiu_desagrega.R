
#' Consultar CIIU 2012
#'
#' La función retorna todos los elementos contenidos en la desagregación
#' consultada.
#'
#'
#'
#' @param let Path to the input file
#' @return A matrix of the infile
#' @export

division <- function(let=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(let)){
    dplyr::filter(dplyr::filter(base,seccion==let),
                  is.na(grupo)&is.na(clase)&is.na(subclase)&!is.na(division))
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus divisiones")
  }
}

division()
division("C")
