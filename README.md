
# ciiu2012cl

Paquete R muy simple y en desarrollo para trabajar con el Clasificador
Internacional Industrial Uniforme (CIIU) 2012 ajustado para Chile.

# Instalar y cargar paquete

``` r
install.packages("devtools")
devtools::install_github("nicolasrattor/ciiu2012cl")
```

``` r
library(ciiu2012cl)
```

# Uso del paquete

## Obtener glosas segun dígitos

Obtener todas las secciones de CIIU (1 dígito)

``` r
ciiu_digitos(1)
```

| seccion | glosa                                                                                                                                           |
|:--------|:------------------------------------------------------------------------------------------------------------------------------------------------|
| A       | Agricultura, ganadería, silvicultura y pesca                                                                                                    |
| B       | Explotación de minas y canteras                                                                                                                 |
| C       | Industrias manufactureras                                                                                                                       |
| D       | Suministro de electricidad, gas, vapor y aire acondicionado                                                                                     |
| E       | Suministro de agua; evacuación de aguas residuales, gestión de desechos y descontaminación                                                      |
| F       | Construcción                                                                                                                                    |
| G       | Comercio al por mayor y al por menor; reparación de vehículos automotores y motocicletas                                                        |
| H       | Transporte y almacenamiento                                                                                                                     |
| I       | Actividades de alojamiento y de servicio de comidas                                                                                             |
| J       | Información y comunicaciones                                                                                                                    |
| K       | Actividades financieras y de seguros                                                                                                            |
| L       | Actividades inmobiliarias                                                                                                                       |
| M       | Actividades profesionales, científicas y técnicas                                                                                               |
| N       | Actividades de servicios administrativos y de apoyo                                                                                             |
| O       | Administración pública y defensa; planes de seguridad social de afiliación obligatoria                                                          |
| P       | Enseñanza                                                                                                                                       |
| Q       | Actividades de atención de la salud humana y de asistencia social                                                                               |
| R       | Actividades artísticas, de entretenimiento y recreativas                                                                                        |
| S       | Otras actividades de servicios                                                                                                                  |
| T       | Actividades de los hogares como empleadores; actividades no diferenciadas de los hogares como productores de bienes y servicios para uso propio |
| U       | Actividades de organizaciones y órganos extraterritoriales                                                                                      |

También se pueden obtener divisiones (2 dígitos), grupo (3 dígitos),
clase (4 dígitos) y subclase (5 dígitos).

``` r
ciiu_digitos(2)
ciiu_digitos(3)
ciiu_digitos(4)
ciiu_digitos(5)
```

## Obtener todos los elementos dentro de una letra

Obtener para una letra todas las divisiones, grupos, clases y subclases.

Sección R, por ejemplo

``` r
ciiu2012cl::ciiu_consulta("R")
```

## Obtener solo las divisiones (2 dígitos) dentro de letra

``` r
ciiu2012cl::division("R")
```

    ## # A tibble: 4 x 3
    ##   seccion division glosa                                                        
    ##   <chr>   <chr>    <chr>                                                        
    ## 1 R       90       Actividades creativas, artísticas y de entretenimiento       
    ## 2 R       91       Actividades de bibliotecas, archivos y museos y otras activi~
    ## 3 R       92       Actividades de juegos de azar y apuestas                     
    ## 4 R       93       Actividades deportivas, de esparcimiento y recreativas

## Buscar palabra

``` r
ciiu2012cl::ciiu_glosa(buscar="calzado")
```

    ## # A tibble: 11 x 6
    ##    seccion division grupo clase subclase glosa                                  
    ##    <chr>   <chr>    <chr> <chr> <chr>    <chr>                                  
    ##  1 C       15       152   <NA>  <NA>     Fabricación de calzado                 
    ##  2 C       15       152   1520  <NA>     Fabricación de calzado                 
    ##  3 C       15       152   1520  15200    Fabricación de calzado                 
    ##  4 G       46       464   4641  <NA>     Venta al por mayor de productos textil~
    ##  5 G       46       464   4641  46410    Venta al por mayor de productos textil~
    ##  6 G       47       477   4771  <NA>     Venta al por menor de prendas de vesti~
    ##  7 G       47       477   4771  47710    Venta al por menor de prendas de vesti~
    ##  8 G       47       478   4782  <NA>     Venta al por menor de productos textil~
    ##  9 G       47       478   4782  47820    Venta al por menor de productos textil~
    ## 10 S       95       952   9523  <NA>     Reparación de calzado y de artículos d~
    ## 11 S       95       952   9523  95230    Reparación de calzado y de artículos d~

## Obtener toda la CIIU

También se puede necesitar guardar la CIIU completa como data frame

``` r
ciiu <- ciiu_consulta()
table(ciiu$seccion)
```

    ## 
    ##   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T 
    ## 101  50 378  14  27  35 116  72  23  75  53   9  50  79  21  22  35  31  45  12 
    ##   U 
    ##   5
