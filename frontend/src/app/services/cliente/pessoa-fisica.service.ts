import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UsuariosService } from '../usuarios/usuarios.service';
import { PessoaFisica } from '../../models/cliente/pessoa-fisica';
import { environment } from '../../../../environment.prod';

@Injectable({
  providedIn: 'root'
})
export class PessoaFisicaService {
  private apiUrl = `${environment.apiUrl}/pessoa-fisica`;

  constructor(private http: HttpClient, private usuariosService: UsuariosService) {}

  getAll(): Observable<PessoaFisica[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<PessoaFisica[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  getById(id: number): Observable<PessoaFisica> {
    return this.http.get<PessoaFisica>(`${this.apiUrl}/${id}`);
  }

  create(pessoaFisica: PessoaFisica): Observable<PessoaFisica> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...pessoaFisica, idEmpresa };
    return this.http.post<PessoaFisica>(this.apiUrl, body);
  }

  update(id: number, pessoaFisica: PessoaFisica): Observable<PessoaFisica> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...pessoaFisica, idEmpresa };
    return this.http.put<PessoaFisica>(`${this.apiUrl}/${id}`, body);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
