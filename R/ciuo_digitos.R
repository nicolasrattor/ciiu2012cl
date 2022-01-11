
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

ciuo_digitos <- function(digitos=NA_real_){
  ciuo <- dplyr::rename(ciuo,glosa=titulo_sp)
  if(is.na(digitos)){
    ciuo
  } else if(digitos=="iricmo"){
    ciuo <- ciuo[ciuo$ciuo_08_code %in% c("1","2","3","4","51","52","7","8","9"),]
    ciuo$grupo <- c(1:9)
    ciuo$ciuo_08_code <- NULL
    ciuo
  } else if(digitos==1){
    ciuo$nivel <- nchar(ciuo$ciuo_08_code)
    dplyr::select(ciuo[ciuo$nivel==digitos,],-nivel)
  } else if(digitos==2){
    ciuo$nivel <- nchar(ciuo$ciuo_08_code)
    dplyr::select(ciuo[ciuo$nivel==digitos,],-nivel)
  } else if(digitos==3){
    ciuo$nivel <- nchar(ciuo$ciuo_08_code)
    dplyr::select(ciuo[ciuo$nivel==digitos,],-nivel)
  } else if(digitos==4){
    ciuo$nivel <- nchar(ciuo$ciuo_08_code)
    dplyr::select(ciuo[ciuo$nivel==digitos,],-nivel)
  } else{
    print("Incorrecto número de digitos. Coloque 1, 2, 3, 4 o iricmo")
  }
}

ciuo_digitos()
ciuo_digitos("iricmo")
ciuo_digitos(1)
ciuo_digitos(2)
ciuo_digitos(3)
ciuo_digitos(4)
ciuo_digitos(5)
