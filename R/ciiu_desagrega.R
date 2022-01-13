
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


division <- function(letra=NA_character_){
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    ciiu <- dplyr::filter(dplyr::filter(ciiu,seccion==letra),
                  is.na(grupo)&is.na(clase)&is.na(subclase)&!is.na(division))
    ciiu[,c("seccion","division","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus divisiones")
  }
}


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
#' grupo("C")


grupo <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    ciiu <- dplyr::filter(dplyr::filter(ciiu,seccion==letra),
                          is.na(clase)&is.na(subclase)&!is.na(grupo))
    ciiu[,c("seccion","grupo","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus grupos")
  }
}


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
#' clase("C")

clase <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    ciiu <- dplyr::filter(dplyr::filter(ciiu,seccion==letra),
                          is.na(subclase)&!is.na(clase))
    ciiu[,c("seccion","clase","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus clases")
  }
}

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
#' subclase("C")

subclase <- function(letra=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(letra)){
    ciiu <- dplyr::filter(dplyr::filter(ciiu,seccion==letra),
                          !is.na(subclase))
    ciiu[,c("seccion","subclase","glosa")]
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus subclases")
  }
}



#' Buscar desagregaciones CIIU 2012 dentro de letras
#'
#' Entrega glosa de la seccion
#'
#'
#'
#'
#' @param letra Sección a desagregar. Como carácter.
#' @return Tabla con número de la desagregación buscada y glosa
#' @export
#'
#' @examples
#' seccion("C")


seccion <- function(letra=NA_character_){
  if(!is.na(letra)){
    ciiu <- dplyr::filter(dplyr::filter(ciiu,seccion==letra),is.na(division))
    ciiu$glosa
  } else{
    print("Agregue sección de CIIU (letra), para conocer sus divisiones")
  }
}






