#FUNCAO: SCRIPT DE MONTAGEM DOS DADOS DO CAR - Alternativa
#VERSAO: VERSAO 1
#DATA: 06/06/2023
#RESPONSAVEL: João Paulo Ribeiro
#Contato: joao.ribeiro@ipam.org.br


# PRIMEIRA PARTE ----

#Observação: Os dados vem no formato compactado por municipio. 
# É necessário descompactar os dados em pastas separadas. 
# Pode ser feito da seguinte forma: Botão Direito -> unzip in separate folders


#variaveis para os shps ----
var1 <- ".*RESERVA_LEGAL.*\\.shp"
var2 <- ".*APP.*\\.shp"
var3 <- ".*AREA_ALTITUDE_SUPERIOR_1800.*\\.shp"
var4 <- ".*AREA_CONSOLIDADA.*\\.shp"
var5 <- ".*AREA_DECLIVIDADE_MAIOR_45.*\\.shp"
var6 <- ".*AREA_IMOVEL.*\\.shp"
var7 <- ".*AREA_POUSIO.*\\.shp"
var8 <- ".*AREA_TOPO_MORRO.*\\.shp"
var9 <- ".*BANHADO.*\\.shp"
var10 <- ".*BORDA_CHAPADA.*\\.shp"
var11 <- ".*HIDROGRAFIA.*\\.shp"
var12 <- ".*MANGUEZAL.*\\.shp"
var13 <- ".*NASCENTE_OLHO_DAGUA.*\\.shp"
var14 <- ".*RESERVA_LEGAL.*\\.shp"
var15 <- ".*RESTINGA.*\\.shp"
var16 <- ".*SERVIDAO_ADMINISTRATIVA.*\\.shp"
var17 <- ".*USO_RESTRITO.*\\.shp"
var18 <- ".*VEGETACAO_NATIVA.*\\.shp"
var19 <- ".*VEREDA.*\\.shp"

# Mudar para o endereço onde se encontram os dados ----
path1 <- setwd("C:/Users/joao.ribeiro/Downloads/montagem/ano_2023/Rondonia") # 

folders <- list.files(path1) # retorna todos os arquivos que estão no diretório
geocodigo <- sapply(strsplit(folders, split = '_', fixed = TRUE), function(x) (x[2]))

# Função para descompactar um arquivo ZIP em um diretório específico ----
descompactar_arquivo_zip <- function(folder, arquivo) {
  unzip(paste(folder, arquivo, sep = "/"), exdir = folder)
}

# Lista de arquivos a serem descompactados ----
arquivos <- c("APP.zip",
              "AREA_ALTITUDE_SUPERIOR_1800.zip",
              "AREA_CONSOLIDADA.zip",
              "AREA_DECLIVIDADE_MAIOR_45.zip",
              "AREA_IMOVEL.zip", 
              "AREA_POUSIO.zip", 
              "AREA_TOPO_MORRO.zip", 
              "BANHADO.zip", 
              "BORDA_CHAPADA.zip", 
              "HIDROGRAFIA.zip", 
              "MANGUEZAL.zip", 
              "NASCENTE_OLHO_DAGUA.zip", 
              "RESERVA_LEGAL.zip", 
              "RESTINGA.zip", 
              "SERVIDAO_ADMINISTRATIVA.zip", 
              "USO_RESTRITO.zip", 
              "VEGETACAO_NATIVA.zip", 
              "VEREDA.zip",
              "APP_1.zip",
              "APP_2.zip",
              "APP_3.zip",
              "APP_4.zip",
              "AREA_ALTITUDE_SUPERIOR_1800_1.zip",
              "AREA_ALTITUDE_SUPERIOR_1800_2.zip",
              "AREA_ALTITUDE_SUPERIOR_1800_3.zip",
              "AREA_ALTITUDE_SUPERIOR_1800_4.zip",
              "AREA_CONSOLIDADA_1.zip",
              "AREA_CONSOLIDADA_2.zip",
              "AREA_CONSOLIDADA_3.zip",
              "AREA_CONSOLIDADA_4.zip",
              "AREA_DECLIVIDADE_MAIOR_45_1.zip",
              "AREA_DECLIVIDADE_MAIOR_45_2.zip",
              "AREA_DECLIVIDADE_MAIOR_45_3.zip",
              "AREA_DECLIVIDADE_MAIOR_45_4.zip",
              "AREA_IMOVEL_1.zip",
              "AREA_IMOVEL_2.zip",
              "AREA_IMOVEL_3.zip",
              "AREA_IMOVEL_4.zip",
              "AREA_POUSIO_1.zip",
              "AREA_POUSIO_2.zip",
              "AREA_POUSIO_3.zip",
              "AREA_POUSIO_4.zip",
              "AREA_TOPO_MORRO_1.zip",
              "AREA_TOPO_MORRO_2.zip",
              "AREA_TOPO_MORRO_3.zip",
              "AREA_TOPO_MORRO_4.zip",
              "BANHADO_1.zip",
              "BANHADO_2.zip",
              "BANHADO_3.zip",
              "BANHADO_4.zip",
              "BORDA_CHAPADA_1.zip",
              "BORDA_CHAPADA_2.zip",
              "BORDA_CHAPADA_3.zip",
              "BORDA_CHAPADA_4.zip",
              "HIDROGRAFIA_1.zip",
              "HIDROGRAFIA_2.zip",
              "HIDROGRAFIA_3.zip",
              "HIDROGRAFIA_4.zip",
              "MANGUEZAL_1.zip",
              "MANGUEZAL_2.zip",
              "MANGUEZAL_3.zip",
              "MANGUEZAL_4.zip",
              "NASCENTE_OLHO_DAGUA_1.zip",
              "NASCENTE_OLHO_DAGUA_2.zip",
              "NASCENTE_OLHO_DAGUA_3.zip",
              "NASCENTE_OLHO_DAGUA_4.zip",
              "RESERVA_LEGAL_1.zip",
              "RESERVA_LEGAL_2.zip",
              "RESERVA_LEGAL_3.zip",
              "RESERVA_LEGAL_4.zip",
              "RESTINGA_1.zip",
              "RESTINGA_2.zip",
              "RESTINGA_3.zip",
              "RESTINGA_4.zip",
              "SERVIDAO_ADMINISTRATIVA_1.zip",
              "SERVIDAO_ADMINISTRATIVA_2.zip",
              "SERVIDAO_ADMINISTRATIVA_3.zip",
              "SERVIDAO_ADMINISTRATIVA_4.zip",
              "USO_RESTRITO_1.zip",
              "USO_RESTRITO_2.zip",
              "USO_RESTRITO_3.zip",
              "USO_RESTRITO_4.zip",
              "VEGETACAO_NATIVA_1.zip",
              "VEGETACAO_NATIVA_2.zip",
              "VEGETACAO_NATIVA_3.zip",
              "VEGETACAO_NATIVA_4.zip",
              "VEREDA_1.zip",
              "VEREDA_2.zip",
              "VEREDA_3.zip",
              "VEREDA_4.zip")


# Descompacta todas as feições em um loop por município ----
for (folder in folders) {
  for (arquivo in arquivos) {
    descompactar_arquivo_zip(folder, arquivo)
  }
}

#deleta os arquivos fonte (zips) ----
for (i in 1:length(folders)){
  setwd(paste(path1,"/",folders[i],sep=""))
  zips<-list.files(pattern=".zip")
  file.remove(zips)
}

#renomeia as feicoes por monucipio colocando o geocodigo ----
for(i in 1:length(folders)){
  setwd(paste(path1,"/",folders[i],sep=""))
  feicoes<-list.files()
  file.rename(feicoes,paste(geocodigo[i],feicoes,sep=""))
}


# Definir a pasta de origem que contém as subpastas com os arquivos ----
pasta_origem <- path1


# Cria a pasta no caminho especificado ----
dir.create("C:/Users/joao.ribeiro/Downloads/montagem/ano_2023/Rondonia/destiny")

# Definir a pasta de destino onde os arquivos serão movidos ----
pasta_destino <- "C:/Users/joao.ribeiro/Downloads/montagem/ano_2023/Rondonia/destiny"

# Listar todas as subpastas na pasta de origem ----
subpastas <- list.dirs(pasta_origem, recursive = FALSE)

# Loop através de cada subpasta e copiar os arquivos para a pasta de destino ----
for (subpasta in subpastas) {
  arquivos <- list.files(subpasta, full.names = TRUE)
  file.copy(arquivos, pasta_destino)
}

#SEGUNDA PARTE ----

library(sf)
library(foreign)

#Inserir geocodigos nos shapes ----
l.f.trim <- unique(strtrim(list.files(pasta_destino), 7)) #separa somente o numero unico que se refere ao municipio

for (i in 1:length(l.f.trim)) {
  arquivos <- list.files(pasta_destino,
                         pattern = paste(l.f.trim[i], ".*(RESERVA_LEGAL|APP|AREA_ALTITUDE_SUPERIOR_1800|AREA_CONSOLIDADA|AREA_DECLIVIDADE_MAIOR_45|AREA_IMOVEL|AREA_POUSIO|AREA_TOPO_MORRO|BANHADO|BORDA_CHAPADA|HIDROGRAFIA|MANGUEZAL|NASCENTE_OLHO_DAGUA|RESTINGA|SERVIDAO_ADMINISTRATIVA|USO_RESTRITO|VEGETACAO_NATIVA|VEREDA).*\\.dbf",
                                         sep=""))
  
  for (arquivo in arquivos) {
    tryCatch({
      if (grepl("(RESERVA_LEGAL|APP|AREA_ALTITUDE_SUPERIOR_1800|AREA_CONSOLIDADA|AREA_DECLIVIDADE_MAIOR_45|AREA_IMOVEL|AREA_POUSIO|AREA_TOPO_MORRO|BANHADO|BORDA_CHAPADA|HIDROGRAFIA|MANGUEZAL|NASCENTE_OLHO_DAGUA|RESTINGA|SERVIDAO_ADMINISTRATIVA|USO_RESTRITO|VEGETACAO_NATIVA|VEREDA)", arquivo)) {
        tabela <- read.dbf(file.path(pasta_destino, arquivo))
        geocodigo <- rep(l.f.trim[i], nrow(tabela))
        tabela <- cbind(tabela, geocodigo)
        write.dbf(tabela, file.path(pasta_destino, arquivo))
      }
    }, error = function(e) {
      # Tratar o erro (arquivo corrompido)
      mensagem <- paste("O arquivo", arquivo, "está corrompido. Ignorando...")
      print(mensagem)
    })
  }
}


# Obtém a lista de todos os arquivos na pasta ----
arquivos2 <- list.files(pasta_destino)

# Colocando onde serão salvos os arquivos ----
caminho_saida <- "C:/Users/joao.ribeiro/Downloads/montagem/ano_2023/Rondonia/destiny"

# Filtra os arquivos que possuem o nome base. ----
# Aqui temos 19 variaveis, que são as disponíveis no SICAR


#montar APP ----
file_list2 <- list.files(pasta_destino, 
                        pattern = var2, full.names = TRUE)
shapefile_list2 <- lapply(file_list2, read_sf)
tictoc::tic()
app <- do.call(rbind,shapefile_list2)
tictoc::toc()
nome_saida <- "APP_RO_2023.shp"
##Salva o arquivo shapefile resultante ----
st_write(app, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar AREA_ALTITUDE_SUPERIOR_1800 ----
file_list3 <- list.files(pasta_destino, 
                        pattern = var3, full.names = TRUE)
shapefile_list3 <- lapply(file_list3, read_sf)
tictoc::tic()
aas1800 <- do.call(rbind,shapefile_list3)
tictoc::toc()
nome_saida <- "altitude1800_BAHIA_outubro_2018.shp"
##Salva o arquivo shapefile resultante
st_write(aas1800, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar AREA_CONSOLIDADA ----
file_list4 <- list.files(pasta_destino, 
                        pattern = var4, full.names = TRUE)
shapefile_list4 <- lapply(file_list4, read_sf)
tictoc::tic()
aconsol <- do.call(rbind,shapefile_list4)
tictoc::toc()
nome_saida <- "areaconsolidada_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(aconsol, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar AREA_DECLIVIDADE_MAIOR_45 ----
file_list5 <- list.files(pasta_destino, 
                        pattern = var5, full.names = TRUE)
shapefile_list5 <- lapply(file_list5, read_sf)
tictoc::tic()
decli45 <- do.call(rbind,shapefile_list5)
tictoc::toc()
nome_saida <- "declividade45_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(decli45, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar AREA_IMOVEL ----
file_list6 <- list.files(pasta_destino, 
                        pattern = var6, full.names = TRUE)
shapefile_list6 <- lapply(file_list6, read_sf)
tictoc::tic()
areaimovel <- do.call(rbind,shapefile_list6)
tictoc::toc()
nome_saida <- "areaimovel_BAHIA.shp_outubro_2018"
##Salva o arquivo shapefile resultante
st_write(areaimovel, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar AREA_POUSIO ----
file_list7 <- list.files(pasta_destino, 
                        pattern = var7, full.names = TRUE)
shapefile_list7 <- lapply(file_list7, read_sf)
tictoc::tic()
pousio <- do.call(rbind,shapefile_list7)
tictoc::toc()
nome_saida <- "areapousio_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(pousio, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar AREA_TOPO_MORRO ----
file_list8 <- list.files(pasta_destino, 
                        pattern = var8, full.names = TRUE)
shapefile_list8 <- lapply(file_list8, read_sf)
tictoc::tic()
topomorro <- do.call(rbind,shapefile_list8)
tictoc::toc()
nome_saida <- "topomorro_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(topomorro, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar BANHADO ----
file_list9 <- list.files(pasta_destino, 
                        pattern = var9, full.names = TRUE)
shapefile_list9 <- lapply(file_list9, read_sf)
tictoc::tic()
banhado <- do.call(rbind,shapefile_list9)
tictoc::toc()
nome_saida <- "banhado_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(banhado, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar BORDA_CHAPADA ----
file_list10 <- list.files(pasta_destino, 
                        pattern = var10, full.names = TRUE)
shapefile_list10 <- lapply(file_list10, read_sf)
tictoc::tic()
borda <- do.call(rbind,shapefile_list10)
tictoc::toc()
nome_saida <- "bordachapada_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(borda, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar HIDROGRAFIA ----
file_list11 <- list.files(pasta_destino, 
                        pattern = var11, full.names = TRUE)
shapefile_list11 <- lapply(file_list11, read_sf)
tictoc::tic()
hidro <- do.call(rbind,shapefile_list11)
tictoc::toc()
nome_saida <- "hidrografia_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(hidro, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar MANGUEZAL ----
file_list12 <- list.files(pasta_destino, 
                        pattern = var12, full.names = TRUE)
shapefile_list12 <- lapply(file_list12, read_sf)
tictoc::tic()
manguezal <- do.call(rbind,shapefile_list12)
tictoc::toc()
nome_saida <- "manguezal_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(manguezal, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar NASCENTE_OLHO_DAGUA ----
file_list13 <- list.files(pasta_destino, 
                        pattern = var13, full.names = TRUE)
shapefile_list13 <- lapply(file_list13, read_sf)
tictoc::tic()
nascente <- do.call(rbind,shapefile_list13)
tictoc::toc()
nome_saida <- "nascente_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(nascente, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar RESERVA_LEGAL ----
file_list14 <- list.files(pasta_destino, 
                        pattern = var14, full.names = TRUE)
shapefile_list14 <- lapply(file_list14, read_sf)
tictoc::tic()
reservalegal <- do.call(rbind,shapefile_list14)
tictoc::toc()
nome_saida <- "rl_BAHIA_outubro_2018.shp"
##Salva o arquivo shapefile resultante
st_write(reservalegal, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar RESTINGA
file_list15 <- list.files(pasta_destino, 
                        pattern = var15, full.names = TRUE)
shapefile_list15 <- lapply(file_list15, read_sf)
tictoc::tic()
restinga <- do.call(rbind,shapefile_list15)
tictoc::toc()
nome_saida <- "restinga_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(restinga, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar SERVIDAO_ADMINISTRATIVA
file_list16 <- list.files(pasta_destino, 
                        pattern = var16, full.names = TRUE)
shapefile_list16 <- lapply(file_list16, read_sf)
tictoc::tic()
servadm <- do.call(rbind,shapefile_list16)
tictoc::toc()
nome_saida <- "servadm_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(servadm, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar USO_RESTRITO
file_list17 <- list.files(pasta_destino, 
                        pattern = var17, full.names = TRUE)
shapefile_list17 <- lapply(file_list17, read_sf)
tictoc::tic()
usorest <- do.call(rbind,shapefile_list17)
tictoc::toc()
nome_saida <- "usorest_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(usorest, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar VEGETACAO_NATIVA
file_list18 <- list.files(pasta_destino, 
                        pattern = var18, full.names = TRUE)
shapefile_list18 <- lapply(file_list18, read_sf)
tictoc::tic()
vegnat <- do.call(rbind,shapefile_list18)
tictoc::toc()
nome_saida <- "vegnat_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(vegnat, caminho_saida, nome_saida, driver = "ESRI Shapefile")


#montar VEREDA
file_list19 <- list.files(pasta_destino, 
                        pattern = var19, full.names = TRUE)
shapefile_list19 <- lapply(file_list19, read_sf)
tictoc::tic()
vereda <- do.call(rbind,shapefile_list19)
tictoc::toc()
nome_saida <- "vereda_BAHIA.shp"
##Salva o arquivo shapefile resultante
st_write(vereda, caminho_saida, nome_saida, driver = "ESRI Shapefile")


# Itera sobre os demais shapefiles, juntando-os ao objeto vazio
# novamente temos 19 vezes para cada variavel
shapefile_list <- lapply(file_list, read_sf)

tictoc::tic()
all_schools2 <- do.call(rbind,shapefile_list)
tictoc::toc()

# Define o caminho e o nome do arquivo de saída
caminho_saida <- "C:/Users/joao.ribeiro/Downloads/bahia/destiny/"
nome_saida <- "RL_BA2.shp"

# Salva o arquivo shapefile resultante
st_write(all_schools2, caminho_saida, nome_saida, driver = "ESRI Shapefile")
