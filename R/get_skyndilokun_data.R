#' @title Ná í upplýsingar um skyndilokun
#'
#' @description XXX
#'
#' @export
#'
#' @param nr Númer skyndilokunar
#' @param ar Árið. Ef óskilgreint, þá er notað núverandi ár

get_skyndilokun_data <- function(nr, ar) {

  dags.til <- hnit.n <- hnit.v <- NULL # dummy
  cmd <- paste0("select id, heiti, dags_fra, dags_til, fors, vmork, teg_veidisvaeda, undanthaga, skyring from uv.veidisvaedi where teg_veidisvaeda = 'Skyndilokun' and heiti = '",
                nr,"'")
  if(missing(ar)) ar <- lubridate::year(lubridate::now())

  x <- ora::sql(cmd)  %>%
    dplyr::tbl_df() %>%
    dplyr::filter(lubridate::year(dags.til) == ar)

  hnit <- ora::sql(paste0("select * from uv.hnit where veidisv = ",x$id)) %>%
    dplyr::select(hnit.n, hnit.v) %>%
    dplyr::rename(lat = hnit.n, lon = hnit.v)
  tegund <- ora::sql(paste0("select fteg from uv.veidisv_fteg where veidisv_id = ",x$id))$fteg
  heiti <- ora::sql(paste0("select heiti from uv.fteg where id in ",tegund))$heiti
  vf <- ora::sql(paste0("select veidarf from uv.veidisv_veidarf where veidisv_id = ",x$id))$veidarf
  vf2 <- ora::sql(paste0("select heiti from uv.veidarfa where id in ",vf))$heiti

  list(haus = x, hnit = hnit, tegund = heiti, veidarfaeri = vf2)
}
