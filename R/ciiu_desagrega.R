
#' Buscar desagregaciones CIIU 2012 dentro de letras
#'
#' Cuatro funciones que retornas divisiones, grupos, clases o subclases dentro de una sección o letra de CIIU 2012.cl
#'
#'
#'
#'
#' @param letra Sección a desagregar. Como carácter.
#' @return Tabla con número de la desagregación buscada y glosa
#' @export
#'
#' @examples
#' division("C")
#' grupo("C")
#' clase("C")
#' subclase("C")


division <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    base <- dplyr::filter(dplyr::filter(base,seccion==letra),
                  is.na(grupo)&is.na(clase)&is.na(subclase)&!is.na(division))
    base[,c("seccion","division","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus divisiones")
  }
}




grupo <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    base <- dplyr::filter(dplyr::filter(base,seccion==letra),
                          is.na(clase)&is.na(subclase)&!is.na(grupo))
    base[,c("seccion","grupo","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus grupos")
  }
}




clase <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    base <- dplyr::filter(dplyr::filter(base,seccion==letra),
                          is.na(subclase)&!is.na(clase))
    base[,c("seccion","clase","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus clases")
  }
}



subclase <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    base <- dplyr::filter(dplyr::filter(base,seccion==letra),
                          !is.na(subclase))
    base[,c("seccion","subclase","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus subclases")
  }
}






