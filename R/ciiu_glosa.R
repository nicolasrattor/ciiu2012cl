
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
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  ciiu$glosa_low <- tolower(ciiu$glosa)
  if(!is.na(let)){
    aux <- dplyr::filter(ciiu,seccion==let)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(div)){
    aux <- dplyr::filter(ciiu,division==div)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(gru)){
    aux <- dplyr::filter(ciiu,grupo==gru)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(cla)){
    aux <- dplyr::filter(ciiu,clase==cla)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else if(!is.na(sub)){
    aux <- dplyr::filter(ciiu,subclase==sub)
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  } else{
    aux <- ciiu
    dplyr::select(dplyr::filter(aux,stringr::str_detect(glosa_low,tolower(buscar))),-"glosa_low")
  }
}



