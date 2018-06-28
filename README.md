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

Usando ele você irá abstrair todos os serviços que usa para desenvolver para rodarem com docker.

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

Atualmente temos os seguintes serviços configurados:
 - php
 - composer
 - vue
 - quasar

 Então você poderá simplesmente executar:
```bash
$ php -v
```

Quando você estiver em uma pasta que não tenha um container associado a ela sua saída será global.
```
user:~ $ php -v
# docker:global ~> php -v
#
PHP 7.2.4 (cli) (built: Apr  8 2018 12:52:48) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
    with Zend OPcache v7.2.4, Copyright (c) 1999-2018, by Zend Technologies
```

Quando o diretório corrente estiver associado à um container a saída será outra.
```
user:project $ php -v
# docker:project-app ~> php -v
#
PHP 7.0.27 (cli) (built: Jan  9 2018 02:06:56) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies
    with Zend OPcache v7.0.27, Copyright (c) 1999-2017, by Zend Technologies
    with Xdebug v2.6.0, Copyright (c) 2002-2018, by Derick Rethans
    with blackfire v1.18.2~linux-x64-non_zts70, https://blackfire.io, by SensioLabs
```

## Personalizando

Você pode personalizar as principais configurações do projeto.
Vá até a pasta de environment e avalie os parâmetros que estão definidos por lá.
```
$ cd ~/.config/tevun/.config/environment
```

## Problemas comuns

### Address already in use
> docker: Error response from daemon: driver failed programming external connectivity on endpoint * (*): Error starting userland proxy: listen tcp 0.0.0.0:*: bind: address already in use.

#### Solução
Utilize as orientações da seção [Personalizando](#personalizando) e configure as portas no arquivo `images.ini` de acordo com sua utilização de portas.