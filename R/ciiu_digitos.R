
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
  ciiu <- ciiu[,c("seccion","division","grupo","clase","subclase","glosa")]
  if(is.na(digitos)){
    ciiu
  } else if(digitos==1){
    ciiu[is.na(ciiu$subclase)&is.na(ciiu$clase)&
           is.na(ciiu$grupo)&is.na(ciiu$division),c("seccion","glosa")]
  } else if(digitos==2){
    aux <- ciiu[is.na(ciiu$subclase)&is.na(ciiu$clase)&
           is.na(ciiu$grupo),c("seccion","division","glosa")]
    dplyr::filter(aux, !is.na(division))
  } else if(digitos==3){
    aux <- ciiu[is.na(ciiu$subclase)&is.na(ciiu$clase),c("seccion","grupo","glosa")]
    dplyr::filter(aux, !is.na(grupo))
  } else if(digitos==4){
    ciiu[!is.na(ciiu$clase)&is.na(ciiu$subclase),c("seccion","clase","glosa")]
  } else if(digitos==5){
    ciiu[!is.na(ciiu$subclase),c("seccion","subclase","glosa")]
  } else{
    print("Incorrecto número de digitos. Coloque 1, 2, 3, 4 o 5")
  }
}



