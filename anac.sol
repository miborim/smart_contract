// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Anac {
    uint private idade;  // variável da idade do passageiro
    string private nacionalidade;  // variável da idade do passageiro
    address private passageiro;  // endereço do passageiro dono do contrato

    // define o passageiro do contrato e, por padrão, inicializa idade com 18 anos e nacionalidade brasileira
    constructor() {
        passageiro = msg.sender;  // criador do contrato como passageiro
        idade = 18;  // idade padrão inicial
        nacionalidade = "brasileiro" ; // nacionalidade do passageiro
    }

    function setIdade(uint _idade) public {
        require(msg.sender == passageiro, "Apenas o dono pode alterar a idade."); // apenas o dono do contrato pode alterar a idade
        idade = _idade; // nova idade do passageiro
    }

    function setNacionalidade(string calldata _nacionalidade) public {
        require(msg.sender == passageiro, "Apenas o dono pode alterar a nacionalidade."); // apenas o dono do contrato pode alterar a nacionalidade
        nacionalidade = _nacionalidade; // nova nacionalidade do passageiro
    }

    function getIdade() public view returns (uint) {
        return idade; // retorna a idade do passageiro
    }

    // verifica a categoria do passageiro com base na idade
    function verificarCategoria() public view returns (string memory) {
        if (idade >= 18) {
            return "Adulto brasileiro";
        } else {
            return "Crianca ou adolescente brasileiro";
        }
    }

    function verificarNacionalidade() public view returns (string memory) {
        if (keccak256(abi.encodePacked(nacionalidade)) == keccak256(abi.encodePacked("brasileiro"))) {
            if (idade >= 18) {
                return "Adulto brasileiro";
            } else {
                return "Crianca ou adolescente brasileiro";
            }
        } else {
            return "Estrangeiro";
        }
    }
}


