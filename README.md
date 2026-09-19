## Sobre
<p>Este sistema é um app feito por mim para o Salesforce.</p>

<p>Este app permite ao usuário criar tags e atribuí-las aos clientes para melhor organizá-los.</p>
<p>Além da possibilidade de criar e atribuir as tags, o sistema apresenta para o usuário uma lista paginada com as informações das contas: nome da conta, tipo da conta, receita anual, classificação da conta, website, cidade, estado, setor, nome do proprietário e tags atribuídas.</p>
<p>O usuário pode encontrar facilmente qualquer conta que queira por meio dos filtros de pesquisa também implementados neste sistema. Os filtros são: uma ou mais tags, parte do nome do proprietário, parte do nome da conta, tipos de conta, receita anual (maior que e menor que), classificações de conta, parte do nome da cidade, sigla da unidade da federação (estados, distritos e províncias) e parte do nome do setor.</p>
<p>O usuário também pode ordenar a lista de contas e escolher a quantidade de registros por página da lista.</p>

<p>Observação: Eu não limitei o uso das Customer Tags para apenas clientes (customers), então os usuários conseguirão atribuir tags para todo e qualquer outro tipo de conta.</p>

<p>Observação: Os dados contidos na pasta "Dados para Testes" deste sistema são fictícios.</p>

## Motivação
<p>Minhas motivações para a criação deste sistema foram:</p>
<p>Querer contribuir para o Salesforce com um sistema que permita aos usuários pesquisar e organizar clientes de uma forma mais rápida e sofisticada.</p>
<p>Adicionar mais um item ao meu portfólio com mais quatro conhecimentos que domino: Salesforce, Apex, SOQL e LWC (Lightning Web Components).</p>

## Pré-requisitos para ambiente de desenvolvimento
<p>Crie uma conta no Trailblazer (Trailhead), caso não tenha uma.<br/>
https://trailhead.salesforce.com</p>

<p>Crie uma conta de desenvolvedor no Salesforce, caso não tenha uma.<br/>
https://www.salesforce.com/products/free-trial/developer</p>

<p>Instale o Salesforce CLI (Salesforce Comand Line Interface).<br/>
https://developer.salesforce.com/tools/salesforcecli</p>

## Instruções para ambiente de desenvolvimento
<p>Utilize o terminal (para este caso eu recomendo o WindowsPowerShell) dentro da pasta CategorizeCustomers deste projeto.</p>

<p>Para visualizar o resultado no seu navegador, execute os comandos:</p>
<ul>
<li>sf org login web --set-default-dev-hub --alias hub_dev</li>
<li>sf org create scratch --definition-file config/project-scratch-def.json --set-default --alias scratch_org --duration-days 30</li>
<li>sf org login web --alias scratch_org</li>
<li>sf org list</li>
<li>sf project deploy start</li>
<li>sf org open</li>
</ul>

<p>Para implantar (deploy), execute o comando:</p>
<ul>
<li>sf project deploy start</li>
</ul>

<br/>
