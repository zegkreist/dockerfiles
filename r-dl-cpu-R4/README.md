## Introdução

A melhor forma de utilizar esse serviço é subindo via docker-compose. Pois, assim, é possível ter o serviço sempre de "pé", mesmo que o computador seja reiniciado.

ATENÇÃO: Essa é uma imagem GIGANTE, perto dos 11GB. Porém ela tem de tudo, até latex, hugo, pandoc, quarto.

## Uso

Para facilitar a construção do docker-compose eu criei um shell script, `docker-compose-generator.sh`.

Apenas o execute: 

- Será solicitado a criação de uma senha, que será requisitada para entrar no ambiente do RStudio. (não coloque espaços ou algum character do tipo `$&\`, não fiz o esquema para lidar com esse tipo de coisa)
- Também será solicitado o nome de uma pasta que o container terá acesso, dentro do `/home/$USER/`, assim como que nome terá essa pasta DENTRO do container.

Para finalizar, será perguntando se gostaria de iniciar o container no momento, se sim será executado o comando `sudo docker-compose up -d`. Caso queira derrubar o serviço será necessário entrar novamente nessa pasta e usar o comando `docker-compose down`.

O serviço estará disponível em qualquer browser em: http://127.0.0.1:8787/ . O Login será seu `$USER` e a senha o que foi definido usando o scrip de inicialização