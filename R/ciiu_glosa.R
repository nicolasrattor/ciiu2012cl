
#' Buscar glosas CIIU 2012 con palabras claves
#'
#' La función retorna todos los elementos contenidos en la desagregación
#' consultada.
#'
#'
#'
#' @param let Path to the input file
#' @return A matrix of the infile
#' @export

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

ciiu_glosa()
ciiu_glosa("G")
ciiu_glosa(div="47")
ciiu_glosa(gru="472")
ciiu_glosa(cla="4719")
ciiu_glosa(sub="47199")

ciiu_glosa(buscar="Agro")

ciiu_glosa(let="G",buscar="Agro")


