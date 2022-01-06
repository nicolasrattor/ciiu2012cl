
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

ciiu_consulta <- function(let=NA_character_,
                 div=NA_character_,
                 gru=NA_character_,
                 cla=NA_character_,
                 sub=NA_character_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(let)){
    dplyr::filter(base,seccion==let)
  } else if(!is.na(div)){
    dplyr::filter(base,division==div)
  } else if(!is.na(gru)){
    dplyr::filter(base,grupo==gru)
  } else if(!is.na(cla)){
    dplyr::filter(base,clase==cla)
  } else if(!is.na(sub)){
    dplyr::filter(base,subclase==sub)
  } else{
    base
  }
}

ciiu_consulta()
ciiu_consulta("G")
ciiu_consulta(div="47")
ciiu_consulta(gru="472")
ciiu_consulta(cla="4719")
ciiu_consulta(sub="47199")

