
#' Glosas según número de dígitos
#'
#' La función retorna todos los elementos contenidos en la desagregación
#' consultada. Con valor "iricmo" en argumento digitos retorna glosas IRICMO.
#'
#'
#'
#' @param digitos Indicar el número de desglose de CIUO
#' @return Una tibble con las glosas según desglose solicitado
#' @export
#'
#' @examples
#'ciuo_digitos()
#'ciuo_digitos("iricmo")
#'ciuo_digitos(1)
#'ciuo_digitos(2)
#'ciuo_digitos(3)
#'ciuo_digitos(4)
#'ciuo_digitos(5)

ciuo_digitos <- function(digitos=NA_real_){
  if(is.na(digitos)){
    ciuo[,c(1:5)]
  } else if(digitos=="iricmo"){
    ciuo <- ciuo[ciuo$gran_grupo %in% c("1","2","3","4","5","7","8","9")&
                   (is.na(ciuo$subgrupo_principal)|ciuo$subgrupo_principal=="51"|
                      ciuo$subgrupo_principal=="52")&
                   ciuo$glosa!="Trabajadores de los servicios y vendedores de comercios y mercados",]
    ciuo <- ciuo[is.na(ciuo$subgrupo),c(1,5)]
    ciuo$grupo <- c(1:9)
    ciuo$gran_grupo <- NULL
    ciuo
  } else if(digitos==1){
    ciuo[is.na(ciuo$subgrupo_principal)&is.na(ciuo$subgrupo)&
           is.na(ciuo$grupo_primario),c("gran_grupo","glosa")]
  } else if(digitos==2){
    ciuo[is.na(ciuo$subgrupo)&
           is.na(ciuo$grupo_primario)&
           !is.na(ciuo$subgrupo_principal),c("subgrupo_principal","glosa")]
  } else if(digitos==3){
    ciuo[is.na(ciuo$grupo_primario)&
             !is.na(ciuo$subgrupo),c("subgrupo","glosa")]
  } else if(digitos==4){
    ciuo[!is.na(ciuo$grupo_primario),c("grupo_primario","glosa")]
  } else{
    print("Incorrecto número de digitos. Coloque 1, 2, 3, 4 o iricmo")
  }
}

