<p align="center">
  <img 
    src="https://raw.githubusercontent.com/tevun/server/master/badge.png"
    height="150px"
    alt="logo"
  />
</p>

# Dockerize

Ao assumir o uso de container no nosso workflow passamos a encarar alguns desafios.
Logo percebemos que é complicado ter um ambiente completo sem instalar qualquer ferramenta no host.

A iniciativa Dockerize do Tevun busca entregar um fluxo de trabalho confortável para quem usa Docker no seu dia-a-dia.

## Como configurar

> Leia os passos antes de executá-los para entender o que está sendo feito

Faça download do zip desse projeto
```bash
 $ wget -O dockerize.zip https://codeload.github.com/tevun/dockerize/zip/master
```

Descompacte o conteúdo do zip
```bash
$ unzip dockerize.zip -d tevun
```

Execute o script de configuração
```bash
$ cd tevun/dockerize-master/ && ./configure.sh
```

## Como usar

O Dockerize criará um mecanismo de comandos para alternar comandos de serviços para rodar em imagens globais e/ou imagens relativas ao projeto da pasta em que está.