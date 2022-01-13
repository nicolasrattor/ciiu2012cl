
#' Consultar CIIU 2012
#'
#' La función retorna todos los elementos contenidos en la desagregación
#' consultada. Se puede filtrar por letra, división, grupo, clase o subclase
#'
#'
#'
#' @param let letra
#' @param dev division
#' @return Matriz
#' @export
#'
#' @examples
#' ciiu_consulta()
#' ciiu_consulta("G")
#' ciiu_consulta(div="47")
#' ciiu_consulta(gru="472")
#' ciiu_consulta(cla="4719")
#' ciiu_consulta(sub="47199")

ciiu_consulta <- function(let=NA_character_,
                 div=NA_character_,
                 gru=NA_character_,
                 cla=NA_character_,
                 sub=NA_character_){
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(!is.na(let)){
    dplyr::filter(ciiu,seccion==let)
  } else if(!is.na(div)){
    dplyr::filter(ciiu,division==div)
  } else if(!is.na(gru)){
    dplyr::filter(ciiu,grupo==gru)
  } else if(!is.na(cla)){
    dplyr::filter(ciiu,clase==cla)
  } else if(!is.na(sub)){
    dplyr::filter(ciiu,subclase==sub)
  } else{
    ciiu
  }
}



