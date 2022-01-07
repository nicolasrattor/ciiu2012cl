
#' Buscar glosas CIIU 2012 con palabras claves
#'
#'
#'
#'
#'
#'
#' @param buscar Palabra a buscar en glosas
#' @return tablas con todas las desagregaciones cuyas glosas coinciden con lo buscado
#' @export
#'
#' @examples
#' ciiu_glosa(buscar="Agro")
#' ciiu_glosa(let="G",buscar="Agro")

ciiu_glosa <- function(let=NA_character_,
                 div=NA_character_,
                 gru=NA_character_,
                 cla=NA_character_,
                 sub=NA_character_,
                 buscar=""){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  base$glosa_low <- tolower(base$glosa)
  if(!is.na(let)){
    aux <- dplyr::filter(base,seccion==let)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(div)){
    aux <- dplyr::filter(base,division==div)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(gru)){
    aux <- dplyr::filter(base,grupo==gru)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(cla)){
    aux <- dplyr::filter(base,clase==cla)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(sub)){
    aux <- dplyr::filter(base,subclase==sub)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else{
    aux <- base
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  }
}



