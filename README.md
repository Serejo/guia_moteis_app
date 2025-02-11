# guia_moteis_app

Este projeto Flutter foi criado como parte de um teste para uma vaga na Guia de Motéis Go

## Descrição do Projeto

O guia_moteis_app é uma aplicação Flutter desenvolvida para listar e detalhar motéis. O projeto utiliza diversas bibliotecas e segue uma estrutura e design system específicos.

## Bibliotecas Utilizadas

- `provider`: Para gerenciamento de estado.
- `http`: Para realizar requisições HTTP.
- `flutter_svg`: Para exibir imagens SVG.
- `shared_preferences`: Para armazenamento de dados localmente.

## Estrutura do Projeto

A estrutura do projeto segue o padrão recomendado para aplicações Flutter, com separação clara entre camadas de apresentação, lógica de negócios e dados:

- `lib/`
  - `models/`: Contém as classes de modelo.
  - `providers/`: Contém os provedores de estado.
  - `screens/`: Contém as telas da aplicação.
  - `widgets/`: Contém os widgets reutilizáveis.
  - `services/`: Contém os serviços para comunicação com APIs.

## Design System

O design system utilizado no projeto segue as diretrizes do Material Design, garantindo uma interface consistente e intuitiva. Componentes personalizados foram criados para manter a identidade visual da aplicação.

## Clean Code e Clean Architecture

O projeto segue os princípios de Clean Code, garantindo que o código seja legível, simples e fácil de manter. Algumas práticas adotadas incluem:

- Nomes de variáveis e funções descritivos.
- Funções pequenas e focadas em uma única responsabilidade.
- Comentários apenas quando necessário para explicar o "porquê" do código.

Além disso, a arquitetura do projeto segue os princípios de Clean Architecture, promovendo a separação de responsabilidades e facilitando a manutenção e escalabilidade do código. A estrutura do projeto é dividida em camadas:

- **Camada de Apresentação**: Contém a interface do usuário e a lógica de apresentação.
- **Camada de Domínio**: Contém as regras de negócio e casos de uso.
- **Camada de Dados**: Contém a lógica de acesso a dados e comunicação com APIs.

## Testes Unitários

Foram implementados testes unitários para garantir a qualidade e a funcionalidade do código. Os testes cobrem as principais funcionalidades e verificam o comportamento esperado dos componentes e serviços.

## Getting Started

Para começar a usar o projeto, siga os passos abaixo:

1. Clone o repositório.
2. Instale as dependências com `flutter pub get`.
3. Execute a aplicação com `flutter run`.

Para mais informações sobre Flutter, consulte a [documentação online](https://docs.flutter.dev/).
