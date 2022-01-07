
#' Glosas según número de dígitos
#'
#' La función retorna todos los elementos contenidos en la desagregación
#' consultada.
#'
#'
#'
#' @param digitos Indicar el número de desglose de CIIU 2012
#' @return Una tibble con las glosas según desglose solicitado
#' @export
#'
#' @examples
#' ciiu_digitos()
#' ciiu_digitos(1)
#' ciiu_digitos(2)
#' ciiu_digitos(3)
#' ciiu_digitos(4)
#' ciiu_digitos(5)
#' ciiu_digitos(6)
#'
ciiu_digitos <- function(digitos=NA_real_){
  load("~/Github/ciiu2012cl/R/sysdata.rda")
  base <- base[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(is.na(digitos)){
    base
  } else if(digitos==1){
    base[is.na(base$subclase)&is.na(base$clase)&
           is.na(base$grupo)&is.na(base$division),c("seccion","glosa")]
  } else if(digitos==2){
    aux <- base[is.na(base$subclase)&is.na(base$clase)&
           is.na(base$grupo),c("seccion","division","glosa")]
    dplyr::filter(aux, !is.na(division))
  } else if(digitos==3){
    aux <- base[is.na(base$subclase)&is.na(base$clase),c("seccion","grupo","glosa")]
    dplyr::filter(aux, !is.na(grupo))
  } else if(digitos==4){
    base[!is.na(base$clase)&is.na(base$subclase),c("seccion","clase","glosa")]
  } else if(digitos==5){
    base[!is.na(base$subclase),c("seccion","subclase","glosa")]
  } else{
    print("Incorrecto número de digitos. Coloque 1, 2, 3, 4 o 5")
  }
}


