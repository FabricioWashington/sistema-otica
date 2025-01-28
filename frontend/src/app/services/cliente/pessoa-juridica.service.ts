import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UsuariosService } from '../usuarios/usuarios.service';
import { PessoaJuridica } from '../../models/cliente/pessoa-juridica';
import { environment } from '../../../../environment.prod';

@Injectable({
  providedIn: 'root'
})
export class PessoaJuridicaService {
  private apiUrl = `${environment.apiUrl}/pessoa-juridica`;

  constructor(private http: HttpClient, private usuariosService: UsuariosService) {}

  getAll(): Observable<PessoaJuridica[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<PessoaJuridica[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  getById(id: number): Observable<PessoaJuridica> {
    return this.http.get<PessoaJuridica>(`${this.apiUrl}/${id}`);
  }

  create(pessoaJuridica: PessoaJuridica): Observable<PessoaJuridica> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...pessoaJuridica, idEmpresa };
    return this.http.post<PessoaJuridica>(this.apiUrl, body);
  }

  update(id: number, pessoaJuridica: PessoaJuridica): Observable<PessoaJuridica> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...pessoaJuridica, idEmpresa };
    return this.http.put<PessoaJuridica>(`${this.apiUrl}/${id}`, body);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
