import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CargoFuncionario } from '../../models/cargo-funcionario/cargo-funcionario';
import { environment } from '../../../../environment.prod';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root'
})
export class CargoFuncionarioService {
  private apiUrl = `${environment.apiUrl}/cargofuncionario`;

  constructor(
    private http: HttpClient,
    private usuarioService: UsuariosService
  ) {}

  getAll(): Observable<CargoFuncionario[]> {
    const { idEmpresa } = this.usuarioService.getUserEmpresaData();
    return this.http.get<CargoFuncionario[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  getById(id: number): Observable<CargoFuncionario> {
    return this.http.get<CargoFuncionario>(`${this.apiUrl}/${id}`);
  }

  create(cargo: CargoFuncionario): Observable<CargoFuncionario> {
    const { idEmpresa } = this.usuarioService.getUserEmpresaData();
    const body = { ...cargo, idEmpresa };
    return this.http.post<CargoFuncionario>(this.apiUrl, body);
  }

  update(id: number, cargo: CargoFuncionario): Observable<CargoFuncionario> {
    const { idEmpresa } = this.usuarioService.getUserEmpresaData();
    const body = { ...cargo, idEmpresa };
    return this.http.put<CargoFuncionario>(`${this.apiUrl}/${id}`, body);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}

