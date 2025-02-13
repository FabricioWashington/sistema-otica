import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ValidationService {

  constructor() {}

  validateCPF(cpf: string): boolean {
    cpf = cpf.replace(/\D/g, '');

    if (!cpf || cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) {
      return false;
    }

    let soma = 0;
    let resto;

    for (let i = 1; i <= 9; i++) {
      soma += parseInt(cpf.substring(i - 1, i)) * (11 - i);
    }

    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) {
      resto = 0;
    }

    if (resto !== parseInt(cpf.substring(9, 10))) {
      return false;
    }

    soma = 0;
    for (let i = 1; i <= 10; i++) {
      soma += parseInt(cpf.substring(i - 1, i)) * (12 - i);
    }

    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) {
      resto = 0;
    }

    return resto === parseInt(cpf.substring(10, 11));
  }

  validateCNPJ(cnpj: string): boolean {
    cnpj = cnpj.replace(/\D/g, '');

    if (!cnpj || cnpj.length !== 14 || /^(\d)\1+$/.test(cnpj)) {
      return false;
    }

    const tamanho = cnpj.length - 2;
    const numeros = cnpj.substring(0, tamanho);
    const digitos = cnpj.substring(tamanho);

    let soma = 0;
    let pos = tamanho - 7;

    for (let i = tamanho; i >= 1; i--) {
      soma += parseInt(numeros.charAt(tamanho - i), 10) * pos--;
      if (pos < 2) {
        pos = 9;
      }
    }

    let resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado !== parseInt(digitos.charAt(0), 10)) {
      return false;
    }

    soma = 0;
    pos = tamanho - 7;
    for (let i = tamanho + 1; i >= 1; i--) {
      soma += parseInt(cnpj.charAt(tamanho + 1 - i), 10) * pos--;
      if (pos < 2) {
        pos = 9;
      }
    }

    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    return resultado === parseInt(digitos.charAt(1), 10);
  }

  validateCEP(cep: string): boolean {
    const regex = /^[0-9]{5}-[0-9]{3}$/;
    return regex.test(cep);
  }

}
