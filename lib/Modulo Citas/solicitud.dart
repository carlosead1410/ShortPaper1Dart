

// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_is_empty, dead_code

import '../Modulo Suscripccion/Suscripccion.dart';
import '../Modulo Usuarios/doctor.dart';
import '../Modulo Usuarios/pacientes.dart';

enum TipoCita{
    Teleconsulta,
    Presencial
}

class Solicitud{
    TipoCita? _tipo;
    Especialidad? _especialidad;

    Solicitud(TipoCita tipo, Especialidad especialidad){
        _tipo = tipo;
        _especialidad = especialidad;
    }

    TipoCita getTipo(){
        return _tipo!;
    }

    Especialidad getEspecialidad(){
        return _especialidad!;
    }

    bool verificarEspecialidad(Doctor doctor){
        var especializaciones = doctor.getEspecializaciones();
        Especialidad especialidad;

        if (especializaciones.length == 0){
            throw FormatException('El doctor no posee esta especialidad');
            return false;
        }
        for (var especialidad in especializaciones){
            if (especialidad.getNombre() == _especialidad!.getNombre()){
                return true;
            }
        }
        throw FormatException('El doctor no posee esta especialidad');
        return false;
    }

    void verificarSuscripccion(Paciente paciente){
        var suscripcionP = paciente.ObtenerPlan();
        if (suscripcionP.status != StatusSuscripccion.Activa){
            throw FormatException('El Paciente no tiene una suscripccion activa al sistema, NO podra solicitar citas');
        }
    }
}