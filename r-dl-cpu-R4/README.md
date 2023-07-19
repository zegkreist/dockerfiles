## Introdução

A melhor forma de utilizar esse serviço é subindo via docker-compose. Pois, assim, é possível ter o serviço sempre de "pé", mesmo que o computador seja reiniciado.

## Uso

Para facilitar a construção do docker-compose eu criei um shell script, `docker-compose-generator.sh`.

Apenas o execute: 

- Será solicitado a criação de uma senha, que será requisitada para entrar no ambiente do RStudio.
- Também será solicitado o nome de uma pasta que o container terá acesso, dentro do `/home/$USER/`, assim como que nome terá essa pasta DENTRO do container.

Para finalizar, será perguntando se gostaria de iniciar o container no momento, se sim será executado o comando `sudo docker-compose up -d`. Caso queira derrubar o serviço será necessário entrar novamente nessa pasta e usar o comando `docker-compose down`.